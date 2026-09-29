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
  config = lib.mkIf (cfg.enable && cfg.zig.enable) {
    environment.systemPackages = with pkgs; [
      zig
      zls
      pkg-config
    ];
  };
}
