{ inputs, config, pkgs, pkgs-unstable, ... }:

{

    # Enable firefox
    programs.firefox = {
        enable  = true;
        package = pkgs-unstable.firefox;
    };


    environment.systemPackages = [

        #  (pkgs-unstable.vivaldi.overrideAttrs (oldAttrs: rec {
        # version = "8.2.4133.47";
        #  src = pkgs.fetchurl {
        #      url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}-1_amd64.deb";
        #      hash = "sha256-St7C8XxA1PIegF1JDUoPHV9Q/UBuemKzcRfLQqWKX24=";
        #  };
        #  }))
        (pkgs-unstable.vivaldi.overrideAttrs (oldAttrs: rec {
            version = "8.2.4133.52";

            src = pkgs.fetchurl {
                url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}-1_amd64.deb";
                hash = "sha256-QOXpNQULSr7dR98o2AODBHMbvw/3NhqXlh1iB6i8rQM=";
            };

            buildPhase = ''
                runHook preBuild
                echo "Patching Vivaldi binaries"

                for f in chrome_crashpad_handler vivaldi-bin vivaldi-sandbox; do
                  if [ -f "opt/vivaldi/$f" ]; then
                    patchelf \
                      --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
                      --set-rpath "${oldAttrs.libPath}" \
                      "opt/vivaldi/$f"
                  fi
                done

                for f in libGLESv2.so libqt5_shim.so libqt6_shim.so; do
                  if [ -f "opt/vivaldi/$f" ]; then
                    patchelf --set-rpath "${oldAttrs.libPath}" "opt/vivaldi/$f"
                  fi
                done

                echo "Finished patching Vivaldi binaries"
                runHook postBuild
            '';
        }))
        pkgs-unstable.vivaldi-ffmpeg-codecs

        pkgs-unstable.tor-browser

    ];

}
