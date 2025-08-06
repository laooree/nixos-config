{
  description = "My NixOS config flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-xremap.url = "github:nixos/nixpkgs/7fd36ee82c0275fb545775cc5e4d30542899511d";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap-flake.url = "github:xremap/nix-flake";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-xremap, ... }@inputs:
    {
    nixosConfigurations.sigma = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.default
        inputs.xremap-flake.nixosModules.default
        inputs.stylix.nixosModules.stylix

        # Inject an overlay to replace xremap
        ({ config, pkgs, ... }: {
          nixpkgs.overlays = [
            (final: prev: {
              xremap = nixpkgs-xremap.legacyPackages.${prev.system}.xremap;
            })
          ];
        })
      ];
    };
  };
}
