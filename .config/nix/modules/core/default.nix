{ inputs, pkgs, ... }:

{
  imports = [ ./system.nix ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs.fish.enable = true;
  users.users.Maaz.shell = pkgs.fish;

  nix = {
    gc = {
      automatic = true;
      interval = {
        Hour = 3;
        Minute = 15;
        Weekday = 7;
      };
      options = "--delete-older-than 7d";

    };

    settings = {
      experimental-features = "nix-command flakes";

      trusted-users = [
        "root"
        "Maaz"
      ];
      auto-optimise-store = true;
    };
  };

  system.stateVersion = 6;

  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true;
  };

  system.primaryUser = "Maaz";

  time.timeZone = "America/Chicago";

  nixpkgs.hostPlatform = "aarch64-darwin";

  nixpkgs.config.allowUnfree = true;

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
