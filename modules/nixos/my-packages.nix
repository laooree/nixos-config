{ inputs, config, pkgs, ... }:

let

    sbc = pkgs.callPackage (pkgs.fetchFromGitHub {
        owner = "laooree";
        repo = "sbc";
        rev = "dd325ae88976b15c035df317b1270f21c4f0a780";
        sha256 = "sha256-XKbG7UBfBYwpkL5cqBlNj+LDRDTHujx5yKBarcAN2/c=";
    }) {};

in

{

    environment.systemPackages = [
        sbc
    ];

}
