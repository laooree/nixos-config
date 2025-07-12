{ config, input, pkgs, lib, ... }:

{

  programs.cava = {
    enable = true;
    package = pkgs.cava;
    settings = {
      general = {
        framerate = 60;
        bars = 10;
        bar_width = 2;
        lower_cutoff_freq = 30;
        higher_cutoff_freq = 16000;
      };
      output = {
        waveform = 0;
        channels = "mono";
        mono_option = "average";
      };
      # input.method = "alsa";
      smoothing.noise_reduction = 20;
    };
  };

}
