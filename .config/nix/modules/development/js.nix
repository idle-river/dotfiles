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
  config = lib.mkIf (cfg.enable && cfg.js.enable) {
    environment.systemPackages = with pkgs; [
      bun
      nodejs
      typescript
    ];
  };
}
