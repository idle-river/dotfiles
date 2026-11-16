{
  description = "Macbook Darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silicate.url = "github:idle-river/silicate";
    clonee.url = "github:idle-river/clonee";
    aegis.url = "github:idle-river/aegis";
    opal.url = "github:idle-river/opal";
    helium.url = "github:schembriaiden/helium-browser-nix-flake";
    tableplus.url = "github:anaclumos/tableplus.nix";
    sonara.url = "github:nolight132/sonora";
    horizon.url = "github:horizon-rust/horizon";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      nix-homebrew,
      horizon,
      ...
    }:
    let
      username = "Maaz";
    in
    {
      darwinConfigurations."MacBook-Pro" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs username horizon; };

        modules = [
          ./configuration.nix

          {
            system.configurationRevision = self.rev or self.dirtyRev or null;
          }

          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = username;

              autoMigrate = true;
            };
          }
        ];
      };
    };
}
