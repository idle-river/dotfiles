{ pkgs, inputs, ... }:

{
  imports = [
    ./packages.nix
    ./brew.nix
    ./modules/core
    ./modules/aerospace
  ];
}
