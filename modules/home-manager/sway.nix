{ config, input, pkgs, lib, ... }:

{

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;

    xwayland = true;

    config = {

      input = {
        "type:keyboard" = {
          xkb_layout = "it";
          xkb_numlock = "enabled";
        };
        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
        };
        "7119:5:USB_Optical_Mouse".left_handed = "enabled";
      };

      menu = "wofi --show=drun --insensitive --parse-search";
      terminal = "kitty";
      gaps = {
        inner = 20;
        outer = 10;
      };
      modifier = "Mod4";

      output."eDP-1" = {
        # scale = "1.2";
        mode = "2560x1600@60Hz";
        bg = "~/.dotfiles/images/wallpapers/sleepingFox.jpg fill";
      };

      floating = {
        titlebar = false;
      };

      window = {
        titlebar = false;
        border = 3;
      };

      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
        in lib.mkOptionDefault {
          "XF86AudioRaiseVolume"  = "exec --no-startup-id pactl set-sink-volume 0 +5%";
          "XF86AudioLowerVolume"  = "exec --no-startup-id pactl set-sink-volume 0 -5%";
          "XF86AudioMute"         = "exec --no-startup-id pactl set-sink-mute 0 toggle";
          "XF86MonBrightnessDown" = "exec --no-startup-id brightnessctl set 5%-";
          "XF86MonBrightnessUp"   = "exec --no-startup-id brightnessctl set +5%";
        };

    };

    extraConfig = ''
      blur enable
      blur_passes 3
      blur_radius 3
    '';
  };

}
