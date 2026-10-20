{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bitwarden-cli
    doppler
    gnupg
    openssl
    secretspec
  ];
}
