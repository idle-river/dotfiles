# Dotfiles

**A declarative macOS dev environment** — [Nix flakes](https://nixos.wiki/wiki/Flakes) + [nix-darwin](https://github.com/nix-darwin/nix-darwin) for the system, [GNU Stow](https://www.gnu.org/software/stow/) for the configs.

[Wiki](https://github.com/pure-sagacity/dotfiles/wiki) ·
[Quick start](#-quick-start) ·
[Daily commands](#️-daily-commands) ·
[Options](https://github.com/pure-sagacity/dotfiles/wiki/Configuration-Options)

---

## At a glance

|                 | Tool                                                                                                              | Notes                                                 |
| --------------- | ----------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| Shell           | [fish](https://fishshell.com) + [starship](https://starship.rs) + [zoxide](https://github.com/ajeetdsouza/zoxide) | Aliases and functions live in `.config/fish`          |
| Terminal        | [Ghostty](https://ghostty.org)                                                                                    | Catppuccin Mocha, JetBrains Mono, cursor-smear shader |
| Editors         | [Neovim](https://neovim.io) ([LazyVim](https://www.lazyvim.org)) · [Zed](https://zed.dev)                         | Catppuccin / Tokyo Night themes                       |
| Windows         | [AeroSpace](https://nikitabobko.github.io/AeroSpace/guide)                                                        | Tiling WM, `alt` + `hjkl`                             |
| Multiplexer     | [tmux](https://github.com/tmux-plugins/tpm)                                                                       | Catppuccin, mouse on, windows start at 1              |
| Version control | [jj](https://docs.jj-vcs.dev) + git                                                                               | Commits signed with GPG                               |
| Secrets         | Bitwarden SSH agent · GPG · secretspec · Doppler                                                                  | Nothing secret is stored in this repo                 |
| System          | nix-darwin + [nix-homebrew](https://github.com/zhaofengli-wip/nix-homebrew)                                       | Dock, Finder, Touch ID `sudo`, GC, fonts              |

> The full list of what gets installed (and what each thing is for) lives in the wiki: **[Packages](https://github.com/pure-sagacity/dotfiles/wiki/Packages)**.

## Repository layout

```text
Dotfiles/
├── .aerospace.toml            # AeroSpace config   → ~/.aerospace.toml
└── .config/                   # everything below   → ~/.config/
    ├── nix/                   # the system: flake + nix-darwin
    │   ├── flake.nix          #   inputs + the "MacBook-Pro" host
    │   ├── configuration.nix  #   ⭐ feature toggles live here
    │   ├── brew.nix           #   Homebrew brews & casks
    │   └── modules/
    │       ├── core/          #   nix settings, shell, fonts, macOS defaults
    │       ├── packages/      #   system packages, split by category
    │       ├── development/   #   per-language toggles (macbook.development.*)
    │       ├── aerospace/     #   tiling WM settings
    │       └── tailscale/     #   tailscaled service (currently not imported)
    ├── fish/                  # config.fish, functions/, conf.d/
    ├── ghostty/  nvim/  tmux/  zed/  jj/  git/  herdr/  secretspec/  ...
```

More detail: **[Repository Layout](https://github.com/pure-sagacity/dotfiles/wiki/Repository-Layout)** · **[Nix Configuration](https://github.com/pure-sagacity/dotfiles/wiki/Nix-Configuration)**

## Quick start

Apple Silicon Mac required (`aarch64-darwin` is hard-coded in [`modules/core`](.config/nix/modules/core/default.nix)).

**1. Install Nix**

```bash
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
```

Restart the terminal afterwards.

**2. Clone and link**

```bash
git clone https://github.com/pure-sagacity/dotfiles.git "$HOME/Dotfiles"
cd "$HOME/Dotfiles"

# Move existing configs aside so stow doesn't conflict
mkdir -p "$HOME/.config-backup"
for dir in .config/*; do
  name="$(basename "$dir")"
  if [ -e "$HOME/.config/$name" ] || [ -L "$HOME/.config/$name" ]; then
    mv "$HOME/.config/$name" "$HOME/.config-backup/$name"
  fi
done

stow .
```

**3. First activation**

```bash
nix --extra-experimental-features 'nix-command flakes' \
  run nix-darwin -- switch --flake "$HOME/Dotfiles/.config/nix#MacBook-Pro"
```

From then on, use the `nrs` alias below. If you rename the host or user, edit [`flake.nix`](.config/nix/flake.nix).

## Daily commands

Defined in [`.config/fish/config.fish`](.config/fish/config.fish):

| Alias     | Does                                               |
| --------- | -------------------------------------------------- |
| `nrs`     | `darwin-rebuild switch` — apply the current config |
| `update`  | `nix flake update` — bump flake inputs             |
| `upgrade` | `update` then `nrs`                                |
| `check`   | `nix flake check`                                  |
| `clean`   | `nix-collect-garbage -d`                           |

> Flakes only see **git-tracked** files — `git add` any new `.nix` file before running `nrs`.

More aliases, functions, and env vars: **[Shell & Aliases](https://github.com/pure-sagacity/dotfiles/wiki/Shell-and-Aliases)**.

## Turning things on and off

Language toolchains are toggles in [`configuration.nix`](.config/nix/configuration.nix):

```nix
macbook.development = {
  enable = true;
  rust.enable = true;
  python.enable = true;
  go.enable = true;
  js.enable = true;
  c = { enable = true; gui.enable = false; };
  zig.enable = false;
  arduino.enable = false;
};
```

Every option is documented in **[Configuration Options](https://github.com/pure-sagacity/dotfiles/wiki/Configuration-Options)**.

## Notes

- Keep machine-specific secrets out of this repo (`raycast/` and `.kube/` are git-ignored).
- If a tool misbehaves after linking, restore it from `~/.config-backup` and re-link that tool manually.
- To pull changes later: `cd ~/Dotfiles && git pull`, then `stow .` again if new config folders were added.
