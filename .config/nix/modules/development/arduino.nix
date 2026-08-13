{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.macbook.development;
in
{
  config = lib.mkIf (cfg.enable && cfg.c.enable) {
    environment.systemPackages = with pkgs; [
      arduino-cli
      arduino-ide
      arduino-language-server
    ];
  };
}
