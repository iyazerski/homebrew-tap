# Homebrew tap

Mac apps and command-line tools by [Ihar Yazerski](https://github.com/iyazerski), packaged for [Homebrew](https://brew.sh).

## Install

```sh
brew install --cask iyazerski/tap/quill
```

Or add the tap once, then install by name:

```sh
brew tap iyazerski/tap
brew install --cask quill
```

## Apps

| Name | Install | What it does |
| --- | --- | --- |
| [Quill](https://github.com/iyazerski/quill) | `brew install --cask iyazerski/tap/quill` | Fix grammar and translate selected text in any Mac app with one shortcut. |

## Unsigned apps

These apps aren't notarized by Apple, so macOS blocks each one the first time you open it. To allow it, open the app once, then go to **System Settings > Privacy & Security** and click **Open Anyway**. macOS asks only once per app.

## Updates

Each project's release pipeline updates its cask or formula here. Apps that update themselves, like Quill, are marked `auto_updates`, so `brew upgrade` leaves them alone unless you add `--greedy`.
