{ inputs, config, pkgs, pkgs-unstable, ... }:

{

    # Enable firefox
    programs.firefox = {
        enable  = true;
        package = pkgs-unstable.firefox;
    };


    environment.systemPackages = [

        (pkgs-unstable.vivaldi.overrideAttrs (oldAttrs: rec {
        version = "8.1.4087.64-1_amd64";
        src = pkgs.fetchurl {
            url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}.deb";
            hash = "sha256-JXu8TkrWPby/yyC29R9EpitzSpBwYHpH9bWwK2rzb10=";
        };
        }))
        pkgs-unstable.vivaldi-ffmpeg-codecs

        pkgs-unstable.tor-browser

    ];

}
