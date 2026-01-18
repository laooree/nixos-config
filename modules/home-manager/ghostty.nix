{
  pkgs,
  config,
  lib,
  ...
}:

{
  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 16;
      font-family = "Iosevka Nerd Font";
      font-feature = "-calt, -liga, -dlig";

      # background = "#000000";
    };
  };
}
