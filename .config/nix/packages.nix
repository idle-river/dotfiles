{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  zedCompat = pkgs.runCommand "zed-compat" { } ''
    mkdir -p "$out/bin"
    ln -s "${pkgs.zed-editor}/bin/zeditor" "$out/bin/zed"
  '';
  tableplus = (
    inputs.tableplus.packages.${system}.default or inputs.tableplus.defaultPackage.${system}
      or pkgs.tableplus
  );
in
{
  environment.systemPackages = with pkgs; [
    bitwarden-cli
    bitwarden-desktop
    pay-respects
    mosh
    doggo
    devenv
    carapace
    cmatrix
    podman
    podman-compose
    fastfetch
    ffmpeg
    fish
    gnupg
    kubernetes-helm
    helmfile
    kubectl
    lima
    minikube
    nodejs
    openssh
    openssl
    qemu
    sqlite
    stow
    typescript-go
    unzip
    wakeonlan
    python3
    wget
    xh
    xz
    yazi
    yt-dlp
    caddy
    doppler
    gh
    raycast
    pass
    secretspec
    opencode
    go
    gopls
    air
    bun
    parallel
    zed-editor
    zedCompat
    ripgrep
    fzf
    eza
    zoxide
    bat
    starship
    tableplus
    herdr
    fast
    nil # idk why we need this

    inputs.silicate.packages.${system}.default
    inputs.clonee.packages.${system}.default
    inputs.aegis.packages.${system}.default
    inputs.helium.packages.${system}.default
    inputs.sonara.packages.${system}.default
  ];
}
