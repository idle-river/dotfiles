{ lib, pkgs, config, ... }:

let
  cfg = config.macbook.development;
in
{
  config = lib.mkIf (cfg.enable && cfg.rust.enable) {
    environment.variables = {
      RUST_BACKTRACE = "1";
    };

    environment.systemPackages = with pkgs; [
      rustup
      cargo-generate
    ];
  };
}
