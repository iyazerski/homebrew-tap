# Homebrew tap

Mac apps and command-line tools by [Ihar Yazerski](https://github.com/iyazerski), packaged for [Homebrew](https://brew.sh).

## Install

```sh
brew install --cask iyazerski/tap/fettle
brew install iyazerski/tap/lspyx
```

To install by the short name, add and trust the tap once. Homebrew loads casks from other taps only once you trust them:

```sh
brew tap iyazerski/tap
brew trust iyazerski/tap
brew install --cask fettle
brew install lspyx
```

## Apps and tools

| Name | Install | What it does |
| --- | --- | --- |
| [Fettle](https://github.com/iyazerski/fettle) | `brew install --cask iyazerski/tap/fettle` | Fix grammar and translate selected text in any Mac app with one shortcut. |
| [lspyx](https://github.com/iyazerski/lspyx) | `brew install iyazerski/tap/lspyx` | Python code navigation and diagnostics for AI coding agents, as an MCP server and CLI. Runs on macOS and Linux. |

## Unsigned apps

These apps aren't notarized by Apple, so macOS blocks each one the first time you open it. To allow it, open the app once, then go to **System Settings > Privacy & Security** and click **Open Anyway**. macOS asks only once per app.

## Updates

Each project's release pipeline updates its cask or formula here. Apps that update themselves, like Fettle, are marked `auto_updates`, so `brew upgrade` leaves them alone unless you add `--greedy`.
