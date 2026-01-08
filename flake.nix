{
  description = "My NixOS config flake.";

  inputs = {
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
    let
      # Configure alternative nixpkgs with allowUnfree
      system = "x86_64-linux";
      pkgs2511 = import inputs.nixpkgs2511 {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs2505 = import inputs.nixpkgs2505 {
        inherit system;
        config.allowUnfree = true;
      };
    in
      {
        nixosConfigurations.lambda = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit pkgs2511;
            inherit pkgs2505;
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
