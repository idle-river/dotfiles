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
  config = lib.mkIf (cfg.enable && cfg.go.enable) {
    environment.systemPackages = with pkgs; [
      air
      go
      gopls
    ];
  };
}
