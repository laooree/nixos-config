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
          "custom/workspace-separator-left"
          "sway/workspaces"
          "custom/workspace-separator-right"
          "custom/left-dark"
          "sway/window"
          "custom/left-light"
        ];

        modules-center = [
          "privacy"
        ];

        modules-right = [
          "custom/right-light"
          "network"
          "custom/right-dark"
          "custom/right-light"
          "pulseaudio"
          "custom/right-dark"
          "custom/right-light"
          "battery"
          "custom/right-dark"
          "custom/right-light"
          "backlight"
          "custom/right-dark"
          "custom/right-light"
          "disk"
          "custom/right-dark"
          "custom/right-light"
          "tray"
          "custom/right-dark"
          "custom/clock-separator"
          "clock"
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
            "(.*)Mozilla Firefox Private Browsing" = " <span foreground='#ff721f'>󰈹 </span>  Firefox (Incognito)";
            "(.*)Vivaldi" = " <span foreground='#ef3939'>󰖟 </span>  Vivaldi ";
            "(.*)Librewolf" = " <span foreground='#00acff'>󰖟 </span>  Librewolf ";
            "(.*)Librewolf Private Browsing" = " <span foreground='#00acff'>󰖟 </span>  Librewolf (Incognito)";

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
          format = " {icon} {capacity}% ";
          format-charging = "   {capacity}% ";
          format-icons = [ "󰂎" "󰁼" "󰁾" "󰂀" "󰁹" ];
        };

        "backlight" = {
          interval = 10;
          format = " 󰃝  {percent}% ";
        };

        "network" = {
          interval = 5;
          format = " 󰈁 {ifname} ";
          format-ethernet = " 󰈁 {ifname} ";
          format-wifi = "    ({signalStrength}%) {essid} ";
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
        };

        "tray" = {
          icon-size = 20;
          spacing = 10;
        };

        "clock" = {
          format = " 󰸗   {:%B %d, %H:%M}  ";
          tooltip = true;
          tooltip-format = "<tt>{calendar}</tt>";
          locale = "it_IT.UTF-8";
        };

	      "custom/right-dark" = {
		      format = "";
		      tooltip = false;
	      };

	      "custom/right-light" = {
		      format = "";
		      tooltip = false;
	      };

	      "custom/left-dark" = {
		      format = "";
		      tooltip = false;
	      };

	      "custom/left-light" = {
		      format = "";
		      tooltip = false;
	      };

	      "custom/nixos-logo" = {
		      format = "   ";
		      tooltip = true;
          tooltip-format = "NixOS Unstable";
          on-click = "kitty --title 'System Specs' bash -c 'fastfetch; exec bash'";
	      };

	      "custom/workspace-separator-left" = {
		      format = "";
		      tooltip = false;
	      };

	      "custom/workspace-separator-right" = {
		      format = "";
		      tooltip = false;
	      };

        "custom/clock-separator" = {
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
          "custom/left"
          "wlr/taskbar"
          "custom/right"
        ];

        "wlr/taskbar" = {
          format = "{icon} {app_id}";
          icon-size = 24;
          on-click = "activate";
        };

	      "custom/left" = {
		      format = "";
		      tooltip = false;
	      };

	      "custom/right" = {
		      format = "";
		      tooltip = false;
	      };
      };
    };



    style = ''

      * {
        border: none;
        border-radius: 0;
        font-family: "Fira Sans", "Iosevka Nerd Font";
      }

      window#waybar {
        background: #151515;
        color: #c2c2b0;
      }

      #network,
      #pulseaudio,
      #battery,
      #backlight,
      #disk {
        color: #c2c2b0;
        background: #222222;
        font-size: 20px;
      }

      #window {
        color: #c2c2b0;
        background: #222222;
        font-size: 20px;
      }

      #tray {
        background: #222222;
      }

      #clock {
        color: #151515;
        background: #5f875f;
        font-size: 20px;
      }

      #privacy {
        color: #222222;
        background: #fd9720;
      }

      #custom-left-dark,
      #custom-right-dark {
        font-size: 30px;
        color: #151515;
        background: #222222;
      }

      #custom-left-light,
      #custom-right-light {
        font-size: 30px;
        color:#222222;
      }

      #custom-clock-separator {
        font-size: 30px;
        color:#5f875f;
      }

      #custom-workspace-separator-left,
      #custom-workspace-separator-right {
        font-size: 30px;
        color: #242d1d;
      }

      #custom-nixos-logo {
        color: #151515;
        background: #5f875f;
        font-size: 30px;
      }

      #workspaces button {
        padding: 0 0px;
        color: #c2c2b0;
        background: #242d1d;
        border-radius: 0px;
        font-size: 20px;
        font-weight: 700;
      }

      #workspaces button.focused {
        padding: 0 0px;
        color: #c9a554;
        background: #242d1d;
        border-radius: 0px;
        font-size: 26px;
      }

      #taskbar {
        color: #c2c2b0;
        background: #242d1d;
        font-size: 20px;
        padding: 0 10px;
      }

      #taskbar button {
        color: #c2c2b0;
        padding: 0 10px;
      }

      #taskbar button.active {
        color: #c9a554;
        padding: 0 10px;
        font-weight: 700;
      }

      #custom-left,
      #custom-right {
        color: #242d1d;
        background: #151515;
        font-size: 30px;
      }

    '';

  };

}
