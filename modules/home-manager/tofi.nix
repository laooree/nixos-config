{ config, input, pkgs, lib, ... }:

{

  programs.tofi = {
    enable = true;
    package = pkgs.tofi;

    settings = {
      width  = "100%";
      height = "100%";
      border-width  = 0;
      outline-width = 0;
      padding-left = "35%";
      padding-top  = "35%";
      result-spacing = 25;
      num-results = 5;

      font-size = lib.mkForce 24;

      background-color =            lib.mkForce "#${config.lib.stylix.colors.base00}BF";

      text-color =                  lib.mkForce "#${config.lib.stylix.colors.base05}";
      text-background =             lib.mkForce "#00000000";

      input-color =                 lib.mkForce "#${config.lib.stylix.colors.base05}";
      input-background =            lib.mkForce "#00000000";

      prompt-color =                lib.mkForce "#${config.lib.stylix.colors.base0B}";
      prompt-background =           lib.mkForce "#00000000";

      selection-color =             lib.mkForce "#${config.lib.stylix.colors.base00}";
      selection-background =        lib.mkForce "#${config.lib.stylix.colors.base0D}";
      selection-background-padding = "5";

      default-result-color =        lib.mkForce "#${config.lib.stylix.colors.base05}";
      default-result-background =   lib.mkForce "#00000000";

      alternate-result-color =      lib.mkForce "#${config.lib.stylix.colors.base05}";
      alternate-result-background = lib.mkForce "#00000000";

      placeholder-color =           lib.mkForce "#${config.lib.stylix.colors.base0B}";
      placeholder-background =      lib.mkForce "#00000000";

    };
  };

}
