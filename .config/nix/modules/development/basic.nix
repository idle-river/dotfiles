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
      devenv
      fd
      gh
      jujutsu
      neovim
      nixd
      nixfmt
      nixfmt-tree
      opencode
      tmux
    ];
  };
}
