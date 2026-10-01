#!/usr/bin/env pwsh
# Authenticode-signs one Windows PE file with the iyulab code signing certificate (Azure Key Vault).
# Tauri runs it as `bundle.windows.signCommand` for the app, its uninstaller and the installer, passing
# the file path as the only argument. The job must already be logged in to Azure (the iyulab/code-sign
# action does that when it signs the sidecar) and have AzureSignTool on its path.
#
# A Key Vault token is taken for each file: the bundle step runs after the tests and end-to-end
# scenarios, and one token taken at the start of the job may have expired by then.
#
# TODO(upstream): iyulab/code-sign signs a list of files in one step but has no entry point a build
# tool's sign hook can call per file; the Key Vault values below mirror its action defaults.
$ErrorActionPreference = 'Stop'

$file = $args[0]
if (-not $file) { throw 'sign-windows.ps1: no file path given' }

$token = az account get-access-token --resource https://vault.azure.net --query accessToken -o tsv
if ($LASTEXITCODE -ne 0 -or -not $token) { throw 'sign-windows.ps1: no Key Vault access token (is the job logged in to Azure?)' }

AzureSignTool sign `
    --description Lowline `
    --description-url https://github.com/iyulab/lowline `
    --azure-key-vault-url https://kv-codesign-iyulab.vault.azure.net/ `
    --azure-key-vault-accesstoken $token `
    --azure-key-vault-certificate globalsign-ev-codesign `
    --timestamp-rfc3161 http://timestamp.globalsign.com/tsa/r6advanced1 `
    --timestamp-digest sha256 `
    --file-digest sha256 `
    $file
if ($LASTEXITCODE -ne 0) { throw "sign-windows.ps1: AzureSignTool failed with exit code $LASTEXITCODE for $file" }

# The release job checks that every file it expected to be signed went through here.
if ($env:SIGNED_LOG) { Add-Content -Path $env:SIGNED_LOG -Value ([IO.Path]::GetFileName($file)) }
