# Gionnio's Homebrew Tap 🍺

Homebrew tap for my personal macOS apps. More at [gionnio.github.io](https://gionnio.github.io).

## Add the tap

```bash
brew tap gionnio/tap
```

## Apps

| App | Install | Description |
|-----|---------|-------------|
| [Renamy](https://github.com/Gionnio/renamy) | `brew install --cask gionnio/tap/renamy` | Rename and organize your personal video library using TMDB metadata |
| [Tazzina](https://github.com/Gionnio/tazzina) | `brew install --cask gionnio/tap/tazzina` | Keep your Mac awake from the menu bar, with triggers and sounds |
| [Encody](https://github.com/Gionnio/encody) | `brew install --cask gionnio/tap/encody` | Batch video encoder that keeps HDR10, HDR10+ and Dolby Vision |
| [PS2 Manager](https://github.com/Gionnio/ps2manager) | `brew install --cask gionnio/tap/ps2-manager` | Manage backups of your own PS2/PS1 games on an Open PS2 Loader drive |

## Update

```bash
brew upgrade --cask <app>
```

## Uninstall

```bash
brew uninstall --cask <app>
```

Add `--zap` to also remove the app settings.

The apps are not signed with an Apple Developer ID: if macOS blocks the first launch, right-click the app and choose Open, or allow it in System Settings → Privacy & Security.
