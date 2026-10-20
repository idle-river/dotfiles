{ inputs, pkgs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;

  # Adds a `zed` command, since the nixpkgs package only ships `zeditor`
  zedCompat = pkgs.runCommand "zed-compat" { } ''
    mkdir -p "$out/bin"
    ln -s "${pkgs.zed-editor}/bin/zeditor" "$out/bin/zed"
  '';

  tableplus = (
    inputs.tableplus.packages.${system}.default or inputs.tableplus.defaultPackage.${system}
      or pkgs.tableplus
  );
in
{
  environment.systemPackages = with pkgs; [
    aldente
    appcleaner
    bitwarden-desktop
    bruno
    element-desktop
    herdr
    iina
    localsend
    moonlight
    raycast
    slack
    tableplus
    vesktop
    whatcable
    zed-editor
    zedCompat
  ];
}
