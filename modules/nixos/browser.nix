{ inputs, config, pkgs, pkgs-unstable, ... }:

{

  # Enable firefox
  programs.firefox = {
    enable  = true;
    package = pkgs-unstable.firefox;
  };


  environment.systemPackages = [

    (pkgs-unstable.vivaldi.overrideAttrs (oldAttrs: rec {
      version = "8.1.4087.53";
      src = pkgs.fetchurl {
        url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}-1_amd64.deb";
        hash = "sha256-ZpO2xbf92KkreO4CkUMUweiqOJIbI/YMcRgE5PsaM+Q=";
      };
    }))

    pkgs-unstable.vivaldi-ffmpeg-codecs

    pkgs-unstable.tor-browser

  ];

}
