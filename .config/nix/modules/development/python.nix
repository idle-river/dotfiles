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
  config = lib.mkIf (cfg.enable && cfg.python.enable) {
    environment.systemPackages = with pkgs; [
      uv
      ruff
      sphinx
      python3
      basedpyright
    ];
  };
}
