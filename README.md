# omarchy-dotfiles

My [Omarchy](https://omarchy.org) (edge channel) configs, managed with [chezmoi](https://chezmoi.io).
The edge channel's daily migrations occasionally overwrite user config — this repo is the
source of truth for my favorites.

## What's tracked

| Area | Files |
|------|-------|
| Quickshell bar | `.config/omarchy/shell.json`, `.config/omarchy/bar/scripts/` (VPN status, BTC ticker) |
| Hyprland | `.config/hypr/*.lua` |
| Shell | `.bashrc` (fastfetch guarded to top-level terminals only) |
| Fastfetch | `.config/fastfetch/` incl. animated logo |
| Omarchy extras | menu extensions, `hooks/post-update` drift notifier |

## Daily workflow

`omarchy update` runs the `post-update` hook automatically. If the update drifted any
tracked file, a notification appears. Then:

```bash
chezmoi diff        # see what the update changed
chezmoi apply       # restore my versions
# — or, if the new upstream version is actually better:
chezmoi add <file>  # adopt it as the new favorite
git -C ~/Documents/PERSONAL/omarchy-dotfiles commit -am "adopt upstream change" && git -C ~/Documents/PERSONAL/omarchy-dotfiles push
```

## New machine bootstrap

```bash
pacman -S chezmoi
chezmoi init --apply https://github.com/aalhabli/omarchy-dotfiles.git
```
