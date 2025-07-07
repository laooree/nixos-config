{ config, input, pkgs, lib, ... }:

{

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;

    xwayland = true;

    config = {

      colors.focused = {
        background = lib.mkForce "#${config.lib.stylix.colors.base00}";
        border = lib.mkForce "#${config.lib.stylix.colors.base0D}";
        childBorder = lib.mkForce "#${config.lib.stylix.colors.base0D}";
        indicator = lib.mkForce "#${config.lib.stylix.colors.base0D}";
        text = lib.mkForce "#${config.lib.stylix.colors.base06}";
      };
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

      output = {
        "HDMI-A-1" = {
          # mode = "2560x1600@59.951Hz";
          bg = "~/.dotfiles/images/wallpapers/nord_mountains.png fill";
        };
        "eDP-1" = {
          # scale = "1.2";
          mode = "2560x1600@60Hz";
          bg = "~/.dotfiles/images/wallpapers/nord_mountains.png fill";
        };
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

      bars = [
        {
          command = "swaybar";
          statusCommand = "i3blocks";
          position = "bottom";
          fonts = {
            names = [ "Iosevka Nerd Font" ];
            style = "Regular";
            size = 16.0;
          };
          colors = {
            background = "#${config.lib.stylix.colors.base00}";
            focusedWorkspace = {
              background = "#${config.lib.stylix.colors.base0D}";
              border = "#${config.lib.stylix.colors.base0D}";
              text = "#${config.lib.stylix.colors.base00}";
            };
            inactiveWorkspace = {
              background = "#${config.lib.stylix.colors.base00}";
              border = "#${config.lib.stylix.colors.base00}";
              text = "#${config.lib.stylix.colors.base06}";
            };
            separator = "#${config.lib.stylix.colors.base06}";
          };
        }
      ];
    };

    extraConfig = ''
      blur enable
      blur_passes 1
      blur_radius 5
    '';

  };


  programs.i3blocks = {
    enable = true;
    bars =
      {
        config = {
          wifi = {
            command = "${config.home.homeDirectory}/scripts/i3blocks/wifi.sh";
            interval = 5;
          };
          battery = lib.hm.dag.entryAfter [ "wifi" ] {
            command = "${config.home.homeDirectory}/scripts/i3blocks/battery.sh";
            interval = 5;
          };
          datetime = lib.hm.dag.entryAfter [ "battery" ] {
            command = "${config.home.homeDirectory}/scripts/i3blocks/datetime.sh";
            interval = 5;
          };
        };
      };
  };

  home.file = {
    "scripts/i3blocks/wifi.sh" = {
    source = ./i3blocks_scripts/wifi.sh;
    executable = true;
    };
    "scripts/i3blocks/battery.sh" = {
    source = ./i3blocks_scripts/battery.sh;
    executable = true;
    };
    "scripts/i3blocks/datetime.sh" = {
    source = ./i3blocks_scripts/datetime.sh;
    executable = true;
    };
  };

}
