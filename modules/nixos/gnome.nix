{
  inputs,
  config,
  pkgs,
  ...
}:

{

  # Enable the Gnome Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable dconf
  programs.dconf.enable = true;

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
      simple-scan
      tali # poker game
      totem # video player
    ]
  );


  environment.systemPackages = with pkgs;
    [
      gnomeExtensions.blur-my-shell
      gnomeExtensions.pip-on-top
      gnomeExtensions.paperwm
      gnomeExtensions.dash-to-dock
      gnomeExtensions.user-themes
      gnomeExtensions.tactile
      gnomeExtensions.just-perfection

      # Customization
      gnome-tweaks
    ];

}
