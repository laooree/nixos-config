{ inputs, config, pkgs, pkgs-unstable, ... }:

{

    # Enable firefox
    programs.firefox = {
        enable  = true;
        package = pkgs-unstable.firefox;
    };


    environment.systemPackages = [

        (pkgs-unstable.vivaldi.overrideAttrs (oldAttrs: rec {
            version = "8.2.4133.84";
            src = pkgs.fetchurl {
                url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}-1_amd64.deb";
                hash = "sha256-3whviT+Fd2q2jq9tuZHe7eE00oD9stbHST+j/zDIMB4=";
            };
        }))
        pkgs-unstable.vivaldi-ffmpeg-codecs

        pkgs-unstable.tor-browser

    ];

}
