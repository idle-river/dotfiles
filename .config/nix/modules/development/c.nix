{ lib, pkgs, config, ... }:

let
  cfg = config.macbook.development;
in
{
  config = lib.mkIf (cfg.enable && cfg.c.enable) {
    environment.systemPackages = with pkgs; [
      gcc
      cmake
      ninja
      nasm
    ];
  };
}
