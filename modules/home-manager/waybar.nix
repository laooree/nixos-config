{ config, input, pkgs, lib, ... }:

{

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;


    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 30;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [
          "custom/nixos-logo"
          "custom/left-dark"
          "sway/workspaces"
          "custom/left-light"
          "custom/left-dark"
          "sway/window"
          "custom/left-light"
        ];
        modules-center = [
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
            "(.*)Vivaldi" = " <span foreground='#ef3939'>󰖟 </span>  Vivaldi ";

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
    };



    style = ''

      * {
        font-family: "FiraSans", "Iosevka Nerd Font";
      }

      #network,
      #pulseaudio,
      #battery,
      #backlight,
      #disk {
        color: #${config.lib.stylix.colors.base05};
        background: #${config.lib.stylix.colors.base02};
        font-size: 20px;
      }

      #window {
        color: #${config.lib.stylix.colors.base05};
        background: #${config.lib.stylix.colors.base02};
        font-size: 20px;
      }

      #clock {
        color: #${config.lib.stylix.colors.base00};
        background: #${config.lib.stylix.colors.base0D};
        font-size: 20px;
      }

      #custom-left-dark,
      #custom-right-dark {
        font-size: 30px;
        color: #${config.lib.stylix.colors.base00};
        background: #${config.lib.stylix.colors.base02};
      }

      #custom-left-light,
      #custom-right-light {
        font-size: 30px;
        color:#${config.lib.stylix.colors.base02};
      }

      #custom-clock-separator {
        font-size: 30px;
        color:#${config.lib.stylix.colors.base0D};
      }

      #custom-workspace-separator-left,
      #custom-workspace-separator-right {
        font-size: 30px;
        color:#${config.lib.stylix.colors.base02};
      }

      #custom-nixos-logo {
        color: #${config.lib.stylix.colors.base00};
        background: #${config.lib.stylix.colors.base0D};
        font-size: 30px;
      }

      #workspaces button {
        padding: 0 0px;
        color: #${config.lib.stylix.colors.base05};
        background: #${config.lib.stylix.colors.base02};
        border-radius: 0px;
        font-size: 20px;
      }

      #workspaces button.focused {
        padding: 0 0px;
        color: #${config.lib.stylix.colors.base0D};
        background: #${config.lib.stylix.colors.base02};
        border-radius: 0px;
        font-size: 26px;
      }
    '';

  };

}
