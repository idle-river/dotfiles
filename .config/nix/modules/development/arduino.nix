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
  # Have to install the IDE seperately
  config = lib.mkIf (cfg.enable && cfg.arduino.enable) {
    environment.systemPackages = with pkgs; [
      arduino-cli
      arduino-language-server
    ];
  };
}
