{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.macbook.development.python;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      uv
      ruff
      black
      sphinx
      python3
      basedpyright
    ];
  };
}
