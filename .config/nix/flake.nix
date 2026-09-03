{
  description = "Macbook Darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silicate = {
      url = "github:idle-river/silicate";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    clonee = {
      url = "github:idle-river/clonee";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aegis = {
      url = "github:idle-river/aegis";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tableplus = {
      url = "github:anaclumos/tableplus.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sonara = {
      url = "github:idle-river/sonora";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      silicate,
      clonee,
      helium,
      sonara,
      nix-darwin,
      nix-homebrew,
      ...
    }:
    {
      darwinConfigurations."MacBook-Pro" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };

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
              user = "Maaz";

              autoMigrate = true;
            };
          }
        ];
      };
    };
}
