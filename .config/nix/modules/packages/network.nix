{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aria2
    caddy
    doggo
    fast
    mosh
    openssh
    tailscale
    tailscale-gui
    wakeonlan
    wget
    wireshark
    xh
  ];
}
