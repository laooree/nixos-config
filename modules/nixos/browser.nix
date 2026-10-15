{ inputs, config, pkgs, pkgs-unstable, ... }:

{

    # Enable firefox
    programs.firefox = {
        enable  = true;
        package = pkgs-unstable.firefox;
    };


    environment.systemPackages = [

        (pkgs-unstable.vivaldi.overrideAttrs (oldAttrs: rec {
            version = "8.2.4133.87";
            src = pkgs.fetchurl {
                url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}-1_amd64.deb";
                hash = "sha256-DiWdhnEJzqo9AR33/Jn6XMlITkx32zOnBV5d2UHLJC8=";
            };
        }))
        pkgs-unstable.vivaldi-ffmpeg-codecs

        pkgs-unstable.tor-browser

    ];

}
