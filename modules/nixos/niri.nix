{ config, pkgs, pkgs-unstable, inputs, ... }:

{

    programs.niri = {
        enable = true;
        package = pkgs.niri;
    };

    security = {
        polkit.enable = true;
        pam.services.swaylock = {};
    };

    services.gnome.gnome-keyring.enable = true;

    environment.systemPackages = [
        pkgs-unstable.noctalia-shell
        pkgs.xwayland-satellite
        pkgs.nautilus
    ];

}
