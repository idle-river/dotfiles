if status is-interactive

    # Activate Dotenv On CD
    eval (devenv hook fish)

    # Shell Completions / Initializations
    starship init fish | source
    zoxide init fish | source
    doppler completion | source
    tailscale completion fish | source
    herdr completion fish | source

    # Aliases
    alias cat /run/current-system/sw/bin/bat
    alias ocat /bin/cat
    alias docker podman
    alias ls '/run/current-system/sw/bin/eza --icons always'
    alias ols /bin/ls
    alias kubectx 'kubectl config use-context'

    # Pay Respects (thefuck replacement)
    pay-respects fish --alias | source

    # Nix Darwin
    alias nrs 'sudo darwin-rebuild switch --flake ~/Dotfiles/.config/nix#MacBook-Pro'
    alias update 'nix flake update --flake ~/Dotfiles/.config/nix'
    alias upgrade 'update && nrs'
    alias clean 'sudo nix-collect-garbage -d'

    # Nix In General
    abbr --add nixos-rebuild 'nix run nixpkgs#nixos-rebuild --'

    # Simple Aliases (Single Letter Commands)
    alias v nvim
    alias y yazi
    alias k kubectl
    alias j jj
    alias aria aria2c
end

function fish_greeting
end

# Bun
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

# Aliases
alias cea "bunx create-expo-app --no-install"

# Local binaries
fish_add_path "$HOME/.local/bin"

# Bitwarden SSH Agent
set -gx SSH_AUTH_SOCK "/Users/Maaz/.bitwarden-ssh-agent.sock"

# GPG
set -gx GPG_TTY (tty)

# Rust
fish_add_path (brew --prefix rustup)/bin
fish_add_path "$HOME/.cargo/bin"

# Homebrew
fish_add_path /opt/homebrew/bin
set -gx HOMEBREW_NO_ENV_HINTS 1

# Editor
set -gx EDITOR nvim

# SSH Terminal
set -gx TERM xterm-256color

# Homebrew Environment
eval (/opt/homebrew/bin/brew shellenv fish)
