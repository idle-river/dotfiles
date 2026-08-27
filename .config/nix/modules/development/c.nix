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
  config = lib.mkMerge [
    (lib.mkIf cfg.c.enable {
      environment.systemPackages = with pkgs; [
        gcc
        cmake
        ninja
        nasm
        pkg-config
      ];
    })

    (lib.mkIf cfg.c.gui.enable {
      environment.systemPackages = with pkgs; [
        glfw
      ] ++ lib.optionals stdenv.hostPlatform.isLinux [
        libGL
      ];
    })
  ];
}
