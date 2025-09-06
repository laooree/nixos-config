{ config, input, pkgs, lib, ... }:

{

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;


    settings = {
      topBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [
          "custom/nixos-logo"
          "custom/sep-hl-4"
          "custom/sep-ws-2"
          "sway/workspaces"
          "custom/sep-ws-4"
          "custom/sep-bg-2"
          "sway/window"
          "custom/sep-bg-4"
        ];

        modules-center = [
          "privacy"
        ];

        modules-right = [
          "custom/sep-bg-3"
          "network"
          "custom/sep-bg-1"
          "custom/sep-bg-3"
          "pulseaudio"
          "custom/sep-bg-1"
          "custom/sep-bg-3"
          "battery"
          "custom/sep-bg-1"
          "custom/sep-bg-3"
          "backlight"
          "custom/sep-bg-1"
          "custom/sep-bt-3"
          "bluetooth"
          "custom/sep-bt-1"
          "custom/sep-bg-3"
          "tray"
          "custom/sep-bg-1"
          "custom/sep-hl-3"
          "clock"
          "custom/sep-hl-1"
          "custom/sep-pwb-3"
          "custom/powermenu"
        ];

        "sway/workspaces" = {
          format = "  {name}  ";
          disable-scroll = true;
          all-outputs = false;
        };

        "wlr/taskbar" = {
          tooltip = true;
          tooltip-format = "{app_id}: {title}";
          on-click = "activate";
        };

        "sway/window" = {
          format = "{}";
          rewrite = {

            # Window Manager
            "" = " <span foreground='#afa137'> </span>   Sway ";

            # Terminal
            "~(.*)" = " <span foreground='#8c6247'>󰄛 </span>   Kitty ";
            "/(.*)" = " <span foreground='#8c6247'>󰄛 </span>   Kitty ";

            # Browser
            "(.*)Mozilla Firefox" = " <span foreground='#ff721f'>󰈹 </span>  Firefox ";
            "(.*)Mozilla Firefox Private Browsing" = " <span foreground='#ff721f'>󰈹 </span>  Firefox (Incognito) ";
            "(.*)Vivaldi" = " <span foreground='#ef3939'>󰖟 </span>  Vivaldi ";
            "(.*)Librewolf" = " <span foreground='#00acff'>󰖟 </span>  Librewolf ";
            "(.*)Librewolf Private Browsing" = " <span foreground='#00acff'>󰖟 </span>  Librewolf (Incognito) ";

            # Emacs
            "Gnu Emacs" = " <span foreground='#837bc3'> </span>  Emacs ";
            "e" = " <span foreground='#837bc3'> </span>  Emacs ";

            # Spotify
            "Spotify(.*)" = " <span foreground='#1db954'> </span>  Spotify ";

            # commands
            "(.*)nix(.*)" = " <span foreground='#7ebae4'>󱄅 </span>  Nix ";
            "sl" = " <span foreground='#ff4444'> </span>  ciuf ciuf! ";

            # chats - calls
            "(.*)Discord" = " <span foreground='#5c64f3'> </span>  Discord ";
            "(.*)Bageegee(.*)" = " <span foreground='#ff4444'> </span>  Beebee ";
            "Ciorcio(.*)" = " <span foreground='#ff4444'> </span>  Beebee ";

            # games
            "PokeMMO(.*)" = " 󰐝   PokeMMO ";

          };
        };

        "battery" = {
          interval = 10;
          format = " {icon}  {capacity}% ";
          format-charging = "   {capacity}% ";
          format-icons = [ "󰂎" "󰁼" "󰁾" "󰂀" "󰁹" ];
        };

        "backlight" = {
          interval = 10;
          format = " 󰃝   {percent}% ";
        };

        "network" = {
          interval = 5;
          format = " 󰈁 ";
          format-ethernet = " 󰈁 ";
          format-wifi = "     {signalStrength}% ";
          format-disconnected = "󰲛 ";
          on-click = "kitty --title '  Network Manager TUI' bash -c nmtui";
        };

        "disk" = {
          interval = 30;
          path = "/";
          format = "    {used}/{total} ";
        };

        "pulseaudio" = {
          format = "    {volume}% ";
          format-bluetooth = " 󰂰  {volume}% ";
          format-source = "    {volume}% ";
          scroll-step = 2;
          on-click = "~/scripts/waybar/pactl-select-sink.sh";
        };

        "tray" = {
          icon-size = 20;
          spacing = 10;
        };

        "bluetooth" = {
          format-on        = " 󰂯 ";
          format-connected = " 󰂱 ";
          format-off       = " 󰂲 ";
          format-disabled  = " 󰂲 ";
          on-click = "kitty --title '󰂯 Bluetooth TUI' bash -c bluetui";
        };

        "clock" = {
          format = " 󰸗   {:%B %d, %H:%M}  ";
          tooltip = true;
          tooltip-format = "<tt>{calendar}</tt>";
          locale = "it_IT.UTF-8";
        };

	      "custom/separator" = {
		      format = "  ";
		      tooltip = false;
	      };

	      "custom/nixos-logo" = {
		      format = "   ";
		      tooltip = true;
          tooltip-format = "NixOS Unstable";
          on-click = "kitty --title 'System Specs' bash -c 'fastfetch; exec bash'";
	      };

        "custom/powermenu" = {
          format = "   ";
          tooltip = false;
          on-click = "~/scripts/waybar/powermenu.sh";
        };

        "custom/sep-bg-1" = {
          format = "";
          tooltip = false;
        };

        "custom/sep-bg-2" = {
          format = "";
          tooltip = false;
        };

        "custom/sep-bg-3" = {
          format = "";
          tooltip = false;
        };

        "custom/sep-bg-4" = {
          format = "";
          tooltip = false;
        };

        "custom/sep-hl-1" = {
          format = "";
          tooltip = false;
        };

        "custom/sep-hl-3" = {
          format = "";
          tooltip = false;
        };

        "custom/sep-hl-4" = {
          format = "";
          tooltip = false;
        };

        "custom/sep-pwb-3" = {
          format = "";
          tooltip = false;
        };

        "custom/sep-ws-2" = {
          format = "";
          tooltip = false;
        };

        "custom/sep-ws-4" = {
          format = "";
          tooltip = false;
        };

        "custom/sep-bt-1" = {
          format = "";
          tooltip = false;
        };

        "custom/sep-bt-3" = {
          format = "";
          tooltip = false;
        };

      };

      bottomBar = {
        layer = "top";
        position = "bottom";
        height = 30;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];

        modules-center = [
          "wlr/taskbar"
        ];

        "wlr/taskbar" = {
          format = "{icon} {app_id}";
          icon-size = 24;
          on-click = "activate";
        };

      };
    };



    style = ''

      * {
        border: none;
        border-radius: 0;
        font-family: "DINish", "Iosevka Nerd Font";
      }

      window#waybar {
        background: ${config.stylix.base16Scheme.base00};
        color: ${config.stylix.base16Scheme.base05};
      }

      #network,
      #pulseaudio,
      #battery,
      #backlight,
      #disk {
        color: ${config.stylix.base16Scheme.base05};
        background: ${config.stylix.base16Scheme.base01};
        font-size: 22px;
      }

      #window {
        color: ${config.stylix.base16Scheme.base05};
        background: ${config.stylix.base16Scheme.base01};
        font-size: 22px;
      }

      #tray {
        background: ${config.stylix.base16Scheme.base01};
      }

      #bluetooth {
        color: ${config.stylix.base16Scheme.base05};
        background: ${config.stylix.base16Scheme.base15};
        font-size: 22px;
      }

      #clock {
        color: ${config.stylix.base16Scheme.base00};
        background: ${config.stylix.base16Scheme.base07};
        font-size: 22px;
      }

      #privacy {
        color: ${config.stylix.base16Scheme.base00};
        background: ${config.stylix.base16Scheme.base11};
      }

      #custom-separator {
        font-size: 30px;
        color: ${config.stylix.base16Scheme.base00};
        background: ${config.stylix.base16Scheme.base00};
      }

      #custom-nixos-logo {
        color: ${config.stylix.base16Scheme.base00};
        background: ${config.stylix.base16Scheme.base07};
        font-size: 30px;
      }

      #workspaces button {
        padding: 0 0px;
        color: ${config.stylix.base16Scheme.base05};
        background: ${config.stylix.base16Scheme.base10};
        border-radius: 0px;
        font-size: 22px;
        font-weight: 700;
      }

      #workspaces button.focused {
        padding: 0 0px;
        color: ${config.stylix.base16Scheme.base11};
        background: ${config.stylix.base16Scheme.base10};
        border-radius: 0px;
        font-size: 26px;
      }

      #custom-powermenu {
        color: ${config.stylix.base16Scheme.base00};
        background: ${config.stylix.base16Scheme.base08};
        font-size: 22px;
      }

      #taskbar {
        color: ${config.stylix.base16Scheme.base05};
        background: ${config.stylix.base16Scheme.base00};
        font-size: 22px;
        padding: 0 10px;
      }

      #taskbar button {
        color: ${config.stylix.base16Scheme.base05};
        padding: 0 10px;
      }

      #taskbar button.active {
        color: ${config.stylix.base16Scheme.base07};
        padding: 0 10px;
        font-weight: 700;
      }

      #custom-sep-bg-1,
      #custom-sep-bg-2,
      #custom-sep-bg-3,
      #custom-sep-bg-4 {
        color: ${config.stylix.base16Scheme.base01};
        background: ${config.stylix.base16Scheme.base00};
        font-size: 30px;
      }

      #custom-sep-hl-1,
      #custom-sep-hl-3,
      #custom-sep-hl-4 {
        background: ${config.stylix.base16Scheme.base00};
        color: ${config.stylix.base16Scheme.base07};
        font-size: 30px;
      }

      #custom-sep-ws-2,
      #custom-sep-ws-4 {
        background: ${config.stylix.base16Scheme.base00};
        color: ${config.stylix.base16Scheme.base10};
        font-size: 30px;
      }

      #custom-sep-pwb-3 {
        background: ${config.stylix.base16Scheme.base00};
        color: ${config.stylix.base16Scheme.base08};
        font-size: 30px;
      }

      #custom-sep-bt-1,
      #custom-sep-bt-3 {
        background: ${config.stylix.base16Scheme.base00};
        color: ${config.stylix.base16Scheme.base15};
        font-size: 30px;
      }

    '';

  };

  home.file = {

    "scripts/waybar/powermenu.sh" = {
      source = ./scripts/waybar/powermenu.sh;
      executable = true;
    };

    "scripts/waybar/pactl-select-sink.sh" = {
      source = ./scripts/waybar/pactl-select-sink.sh;
      executable = true;
    };

  };

}
