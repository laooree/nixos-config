{ inputs, config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    grim # screenshot
    slurp # screenshot
    wl-clipboard # clipboard manager
    mako # notification
    wofi # launcher
    brightnessctl # brightness control
  ];

  # Enable the gnome-keyring secrets vault. 
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;

  # enable Sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

}
