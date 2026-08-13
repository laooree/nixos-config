{
    inputs,
    config,
    pkgs,
    pkgs-unstable,
    ...
}:

{

    # Enable the Gnome Desktop Environment.
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;


    # Enable dconf
    programs.dconf.enable = true;

    # Enable xdg portal
    xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gnome
            xdg-desktop-portal-gtk
        ];
        config = {
            common = {
                default = [ "gtk" ];
            };
            gnome = {
                default = [ "gnome" "gtk" ];
            };
        };
    };

    # Packages NOT to install with Gnome
    environment.gnome.excludePackages = (
        with pkgs;
        [
            # baobab
            # gnome-calendar
            # gnome-characters
            # gnome-clocks
            # gnome-font-viewer
            # gnome-logs
            # gnome-system-monitor
            # loupe
            # nautilus
            # snapshot
            # yelp
            atomix # puzzle game
            cheese # webcam tool
            decibels
            epiphany
            geary # email reader
            gedit # text editor
            gnome-calculator
            gnome-characters
            gnome-connections
            gnome-console
            gnome-contacts
            gnome-maps
            gnome-music
            gnome-terminal
            gnome-text-editor
            gnome-weather
            hitori # sudoku game
            iagno # go game
            papers
            simple-scan
            tali # poker game
            totem # video player
        ]
    );

    environment.variables = {
        GTK_THEME = "Adwaita:dark";
    };


    environment.systemPackages = [
        pkgs.gnomeExtensions.blur-my-shell
        pkgs.gnomeExtensions.just-perfection
        pkgs.gnomeExtensions.paperwm
        pkgs.gnomeExtensions.pip-on-top
        pkgs.gnomeExtensions.user-themes
        # pkgs-unstable.gnomeExtensions.pop-shell

        pkgs.gsettings-desktop-schemas
        pkgs.evince
        pkgs.dconf-editor
        pkgs.dconf2nix
        pkgs.remmina

    ];

    # Networking
    networking.networkmanager.plugins = [
        pkgs.networkmanager-sstp
        pkgs.networkmanager-openconnect
    ];
}
