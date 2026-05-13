{ inputs, config, pkgs, pkgs-unstable, ... }:

{

  # Enable firefox
  programs.firefox = {
    enable  = true;
    package = pkgs-unstable.firefox;
  };


  environment.systemPackages = [

    (pkgs-unstable.vivaldi.overrideAttrs (oldAttrs: rec {
      version = "7.9.3970.64";
      src = pkgs.fetchurl {
        url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}-1_amd64.deb";
        hash = "sha256-WJn7vmIPJ7/e0UG2uoNedji/Vd0QTY2LNJMBNqTF9Po=";
      };
    }))

    pkgs-unstable.tor-browser

  ];

}
