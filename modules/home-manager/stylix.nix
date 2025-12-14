{
  pkgs,
  config,
  ...
}:

{

  stylix.targets = {

    emacs.enable = false;
    firefox.enable = false;
    kitty.enable = false;
    mako.enable = false;
    rofi.enable = false;
    sway.enable = false;
    waybar.enable = false;

  };

}
