{ lib, ... }:

with lib;
{
  options.macbook.development = {
    enable = mkEnableOption "development tooling";

    rust.enable = mkEnableOption "Rust development tools and environment";

    c = {
      enable = mkEnableOption "C/C++ development tools";
      gui.enable = mkEnableOption "C/C++ GUI app tools";
    };

    arduino.enable = mkEnableOption "Arduino development IDE and CLI";
  };
}
