{ inputs, config, pkgs, pkgs-unstable, ... }:

{

  # Enable firefox
  programs.firefox = {
    enable  = true;
    package = pkgs-unstable.firefox;
  };


  environment.systemPackages = [

    (pkgs-unstable.vivaldi.overrideAttrs (oldAttrs: rec {
      version = "8.1.4087.61-1";
      src = pkgs.fetchurl {
        url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}_amd64.deb";
        hash = "sha256-fluTiicLsQgqGsdBZlRo8QSLI03xjhhXwuZog3Dc44Y=";
      };
    }))
    pkgs-unstable.vivaldi-ffmpeg-codecs

    pkgs-unstable.tor-browser

  ];

}
