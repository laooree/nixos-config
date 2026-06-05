{ inputs, config, pkgs, pkgs-unstable, ... }:

{

  # Enable firefox
  programs.firefox = {
    enable  = true;
    package = pkgs-unstable.firefox;
  };


  environment.systemPackages = [

    (pkgs-unstable.vivaldi.overrideAttrs (oldAttrs: rec {
    version = "8.0.4033.44";

    src = pkgs.fetchurl {
      url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}-1_amd64.deb";
      hash = "sha256-KzDaOntRz8DOcWX5+GhMyGAr+FIh2RC3S6JEIGaBQfE=";
    };
    }))

    pkgs-unstable.tor-browser

  ];

}
