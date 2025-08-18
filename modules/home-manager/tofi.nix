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

      font-size = 24;
      font = "DINish";

      background-color =            lib.mkForce "#222222EF";

      text-color =                  lib.mkForce "#c2c2b0";

      input-color =                 lib.mkForce "#c2c2b0";
      input-background =            lib.mkForce "#00000000";

      prompt-color =                lib.mkForce "#5f875f";
      prompt-background =           lib.mkForce "#00000000";

      selection-color =             lib.mkForce "#222222";
      selection-background =        lib.mkForce "#c2c2b0";
      selection-background-padding = "5";

      default-result-color =        lib.mkForce "#c2c2b0";
      default-result-background =   lib.mkForce "#00000000";

      alternate-result-color =      lib.mkForce "#c2c2b0";
      alternate-result-background = lib.mkForce "#00000000";

      placeholder-color =           lib.mkForce "#5f875f";
      placeholder-background =      lib.mkForce "#00000000";

    };
  };

}
