{ inputs, config, pkgs, pkgs-unstable, ... }:

{

    # Enable firefox
    programs.firefox = {
        enable  = true;
        package = pkgs-unstable.firefox;
    };


    environment.systemPackages = [

        (pkgs-unstable.vivaldi.overrideAttrs (oldAttrs: rec {
        version = "8.1.4087.68-1_amd64";
        src = pkgs.fetchurl {
            url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}.deb";
            hash = "sha256-lomG8ENL0X3cLbNC27j517J39G7IHHbi7BXaharMPWg=";
        };
        }))
        pkgs-unstable.vivaldi-ffmpeg-codecs

        pkgs-unstable.tor-browser

    ];

}
