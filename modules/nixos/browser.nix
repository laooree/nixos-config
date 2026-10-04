{ inputs, config, pkgs, pkgs-unstable, ... }:

{

    # Enable firefox
    programs.firefox = {
        enable  = true;
        package = pkgs-unstable.firefox;
    };


    environment.systemPackages = [

        (pkgs-unstable.vivaldi.overrideAttrs (oldAttrs: rec {
            version = "8.2.4133.83";
            src = pkgs.fetchurl {
                url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}-1_amd64.deb";
                hash = "sha256-O9VbOMwgTnbBizK3nhmqOWz65efBhwGHiWcobs1bGTI=";
            };
        }))
        pkgs-unstable.vivaldi-ffmpeg-codecs

        pkgs-unstable.tor-browser

    ];

}
