{
  lib,
  pkgs,
  config,
  ...
}:

let
  cfg = config.macbook.development;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      neovim
      jujutsu
      fd
      tmux
      nixd
      nixfmt
      nixfmt-tree
    ];
  };
}
