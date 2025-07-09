{ config, input, pkgs, lib, ... }:

{

  programs.cava = {
    enable = true;
    package = pkgs.cava;
    settings = {
      general = {
        framerate = 60;
        bars = 10;
        bar_width = 8;
      };
      output = {
        channels = "mono";
        mono_option = "average";
      };
      # input.method = "alsa";
      smoothing.noise_reduction = 20;
    };
  };

}
