{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    btop # Activity Monitor in CLI
    carapace
    cmatrix
    eza
    fastfetch
    ffmpeg
    fzf
    nil # idk why we need this
    parallel
    pay-respects
    rar
    ripgrep
    sqlite
    starship
    stow
    unzip
    xz
    yazi
    yt-dlp
    zoxide
  ];
}
