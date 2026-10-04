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
      font-family = "AdwaitaMono Nerd Font";
      font-feature = "-calt, -liga, -dlig";

      theme = "Selenized Black";

      shell-integration-features = "no-cursor";
      cursor-style = "block";

      maximize = true;
      title = "ghostty";

      custom-shader = "shaders/cursor_warp.glsl";
      custom-shader-animation = "always";

      background = "181818";
      foreground = "e7e7e7";
      cursor-color = "eeddbb";
      cursor-text = "181818";
      selection-background = "3a3a3a";
      selection-foreground = "e7e7e7";

      palette = [
        "0=#2f2f2f"
        "1=#eca28f"
        "2=#b9d0aa"
        "3=#c0b080"
        "4=#9fbfe7"
        "5=#e9acbf"
        "6=#a0c0d0"
        "7=#bcbcbc"
        "8=#505050"
        "9=#eca28f"
        "10=#b9d0aa"
        "11=#c0b080"
        "12=#9fbfe7"
        "13=#e9acbf"
        "14=#a0c0d0"
        "15=#e7e7e7"
      ];
    };
  };

  xdg.configFile."ghostty/shaders/cursor_warp.glsl".source = ./sources/ghostty/cursor_warp.glsl;
}
