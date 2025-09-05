{ config, input, pkgs, lib, ... }:

{

  programs.rofi.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway;
    checkConfig = false;

    xwayland = true;

    config = {

      colors.focused = {
        background =  "#0f0e06";
        border =      "#d0730f";
        childBorder = "#d0730f";
        indicator =   "#d0730f";
        text =        "#cfbcba";
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

      menu = "rofi -show drun -config ~/.config/rofi/themes/launcher.rasi";
      terminal = "kitty";
      gaps = {
        inner = 20;
        outer = 5;
      };
      modifier = "Mod4";

      output = {
        "HDMI-A-1" = {
          # mode = "2560x1600@59.951Hz";
          bg = "~/.dotfiles/images/wallpapers/blurry-autumn.jpg fill";
        };
        "eDP-1" = {
          # scale = "1.2";
          mode = "2560x1600@60Hz";
          bg = "~/.dotfiles/images/wallpapers/blurry-autumn.jpg fill";
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

          # Volume control
          "XF86AudioRaiseVolume"  = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +2%";
          "XF86AudioLowerVolume"  = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -2%";
          "XF86AudioMute"         = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";

          # Brightness control
          "XF86MonBrightnessDown" = "exec --no-startup-id brightnessctl set 5%-";
          "XF86MonBrightnessUp"   = "exec --no-startup-id brightnessctl set +5%";

          # Screenshot
          "${modifier}+Shift+s" = ''exec grim -g "$(slurp -d)" - | wl-copy'';
          "Print" = ''exec grim -g "$(slurp)" $(xdg-user-dir PICTURES)/Screenshots/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')'';

          # Resize
          "${modifier}+Shift+r" = "mode resize";

          # Browser
          "${modifier}+b" = ''exec --no-startup-id vivaldi'';

          # Split
          "${modifier}+v" = "splitv";
          "${modifier}+h" = "splith";

          # Rofi
          "${modifier}+r" = "exec --no-startup-id rofi -show run -config ~/.config/rofi/themes/launcher.rasi";
          "${modifier}+Shift+e" = "exec ~/scripts/waybar/powermenu.sh";
        };

      bars = [
        {
          command = "waybar";
        }
      ];
    };

    extraConfig = ''
      # Clamshell mode management
      set $laptop eDP-1
      bindswitch --reload --locked lid:on output $laptop disable
      bindswitch --reload --locked lid:off output $laptop enable
      exec_always ~/scripts/sway/clamshell.sh

      # Always set mic volume to 35%
      exec_always pactl set-source-volume alsa_input.pci-0000_03_00.6.analog-stereo 35%

      # Start pcloud on system start
      exec pcloud
    '';

  };

  services.mako = {
    enable = true;
    package = pkgs.mako;
    settings = {

      # actions
      on-button-left  = "invoke-default-action";
      on-button-right = "dismiss";
      default-timeout = 5000; # milliseconds

      # styling
      font = lib.mkForce "DINish 18";
      height = 120;
      width = 360;
      border-size = 3;
      max-icon-size = 75;

      background-color = "#0f0e06ff";
      border-color =     "#d0730f";
      text-color =       "#feeeca";


    };
  };

  home.file = {
    # sway
    "scripts/sway/clamshell.sh" = {
    source = ./scripts/sway/clamshell.sh;
    executable = true;
    };

    # rofi theme
    ".config/rofi/themes/launcher.rasi" = {
      source = ./rofi/launcher.rasi;
    };
  };


}
