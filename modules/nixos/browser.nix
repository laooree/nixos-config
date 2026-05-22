{ inputs, config, pkgs, pkgs-unstable, ... }:

{

  # Enable firefox
  programs.firefox = {
    enable  = true;
    package = pkgs-unstable.firefox;
  };


  environment.systemPackages = [

    (pkgs-unstable.vivaldi.overrideAttrs (oldAttrs: rec {
    version = "8.0.4033.28";

    src = pkgs.fetchurl {
      url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}-1_amd64.deb";
      hash = "sha256-l6XzArL+2tdfVGkBNv+RaziER7KArBR+u8CuS1unBcU=";
    };
    }))

    pkgs-unstable.tor-browser

  ];

}
