# Lowline — Downloads

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/lowline-intro-dark.svg">
  <img src="assets/lowline-intro-light.svg" alt="Lowline" width="320">
</picture>

Lowline is a free, local-first form tool for Windows — your forms, with an AI that learns from your decisions. You write the forms you fill in again and again as plain notes; each filled-in form is a file in a folder you choose. It is being built to learn from the entries you confirm and suggest the fields that call for judgment — you always make the final choice.

## Download

Download `Lowline_<version>_x64-setup.exe` from the
[latest release](https://github.com/iyulab/lowline-releases/releases/latest) and run it. Once installed,
Lowline tells you when a newer release is out and installs it when you choose to.

## System requirements

- Windows 10 or 11 (x64)
- No administrator rights needed — Lowline installs for the current user.
- No internet connection, account, graphics card or AI model is needed. Your documents stay in the folder you choose.

## What leaves your computer

Lowline keeps your documents in the folder you choose and nowhere else. Document contents, field values, file names, form names and folder paths are never sent anywhere, except by you through the chat below.

- **Chat (in development).** It sends something only once you choose a model and write to it. A model on this computer sends nothing out — getting it ready only downloads the model file from Hugging Face and the program that runs it (llama.cpp), or a newer build of it, from GitHub. Choose your own server, or a service you give a key for (OpenAI, Anthropic, Google, xAI), and it sends only there: the form as it stands and what you wrote, when changing a form; the form and the text you pasted, when bringing records in from text; the form and your question, when asking about records. Asking about records sends no record's values — the counting is done on this computer. Keys are kept in Windows Credential Manager.
- **Error reports.** When the app fails, it sends iyulab only what is needed to fix it: which part failed and how, where in Lowline's own code, the app version and the Windows version. Reports are stored in Microsoft Azure (Korea Central) for 90 days; IP addresses are not stored. Until the first stable release, error reporting cannot be turned off; from then on it can be turned off in the app.
- **Update checks.** When the app starts and once a day, it checks GitHub for a newer release. You can turn this off under 정보 (About). An update is installed only when you choose to install it.

## License

Lowline is licensed under the GNU Affero General Public License v3.0. This repository holds the release pipeline and the published installers only.
