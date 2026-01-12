{
  description = "My NixOS config flake.";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
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
    let
      # Configure alternative nixpkgs with allowUnfree
      system = "x86_64-linux";
      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
      {
        nixosConfigurations.lambda = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit pkgs-unstable;
          };
          modules = [
            ./configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.xremap-flake.nixosModules.default
            # inputs.stylix.nixosModules.stylix
          ];
        };
      };
}
