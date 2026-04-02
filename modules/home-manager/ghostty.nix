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

      theme = "Modus Vivendi";

      shell-integration-features = "no-cursor";
      cursor-style = "block";

      maximize = true;
      title = "ghostty";

      custom-shader = "shaders/cursor_warp.glsl";
      custom-shader-animation = "always";
    };
  };

  xdg.configFile."ghostty/shaders/cursor_warp.glsl".source = ./sources/ghostty/cursor_warp.glsl;
}
