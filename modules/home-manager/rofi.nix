{ config, input, pkgs, lib, ... }:

{

  programs.rofi =
    let
      bg0 = "#${config.lib.stylix.colors.base00}";
      bg1 = "#${config.lib.stylix.colors.base01}";
      fg0 = "#${config.lib.stylix.colors.base05}";
      ac  = "#${config.lib.stylix.colors.base0C}";
      uc  = "#${config.lib.stylix.colors.base0A}";
    in
      {
        enable = true;
        package = pkgs.rofi-wayland;

        # This theme is a modified version of rofi squared theme from
        # Newman Sanchez (https://github.com/newmanls)
        theme = lib.mkForce ./rofi-themes/squared.rasi;
      };

}
