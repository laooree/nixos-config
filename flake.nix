{
  description = "My NixOS config flake.";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs2511.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs2505.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # stylix = {
    #   url = "github:danth/stylix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    xremap-flake.url = "github:xremap/nix-flake";
  };

  # outputs = { self, nixpkgs, stylix, ... }@inputs:
  outputs = { self, nixpkgs, ... }@inputs:
    {
    nixosConfigurations.lambda = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.default
        inputs.xremap-flake.nixosModules.default
        # inputs.stylix.nixosModules.stylix
      ];
    };
  };
}
