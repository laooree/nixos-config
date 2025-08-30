{
  pkgs,
  config,
  ...
}:

{

  stylix.targets = {

    emacs.enable = false;
    firefox.enable = false;
    mako.enable = false;
    sway.enable = false;
    rofi.enable = false;
    waybar.enable = false;

  };

}
