{ inputs, config, pkgs, pkgs-unstable, ... }:

{

  # Enable firefox
  programs.firefox = {
    enable  = true;
    package = pkgs-unstable.firefox;
  };


  environment.systemPackages = [

    (pkgs-unstable.vivaldi.overrideAttrs (oldAttrs: rec {
    version = "8.0.4033.26";

    src = pkgs.fetchurl {
      url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}-1_amd64.deb";
      hash = "sha256-6BexB3ZQLNqMPjM9XQgX3RowF+cEJcQmV/Z9QpzhKOE=";
    };
    }))

    pkgs-unstable.tor-browser

  ];

}
