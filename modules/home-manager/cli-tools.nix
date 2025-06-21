{
  pkgs,
  config,
  ...
}:

{

  ##### fastfetch #####
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;
    settings = {
      logo = {
        type = "kitty";
        source = ../../images/logos/nixos-uwu.png;
        height = 15;
        width = 45;
        padding = {
          top = 6;
          left = 3;
        };
      };
      modules = [
        "break"
        {
          type = "custom";
          format = "┌───────────────────── Hardware ─────────────────────┐";
          color = "white";
        }
        {
            type = "host";
            key = "    pc";
            keyColor = "green";
        }
        {
            type = "cpu";
            key = "    cpu";
            keyColor = "green";
        }
        {
            type = "gpu";
            key = "  󰍛  gpu";
            keyColor = "green";
        }
        {
            type = "memory";
            key = "    ram";
            keyColor = "green";
        }
        {
            type = "disk";
            key = "    disk";
            keyColor = "green";
        }
        {
            type = "custom";
            format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
            type = "custom";
            format = "┌───────────────────── Software ─────────────────────┐";
        }
        {
            type = "os";
            key = "    os";
            keyColor = "blue";
        }
        {
            type = "kernel";
            key = "    kernel";
            keyColor = "blue";
        }
        {
            type = "bios";
            key = "    bios";
            keyColor = "blue";
        }
        {
            type = "packages";
            key = "    packages";
            keyColor = "blue";
        }
        {
            type = "shell";
            key = "    shell";
            keyColor = "blue";
        }
        {
            type = "de";
            key = "  󰇄  desktop environment";
            keyColor = "blue";
        }
        {
            type = "lm";
            key = "  󰍂  login manager";
            keyColor = "blue";
        }
        {
            type = "wm";
            key = "    window manager";
            keyColor = "blue";
        }
        {
            type = "wmtheme";
            key = "  󰉼  theme";
            keyColor = "blue";
        }
        {
            type = "terminal";
            key = "    terminal emulator";
            keyColor = "blue";
        }
        {
            type = "custom";
            format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
            type = "custom";
            format = "┌─────────────────────── Time ───────────────────────┐";
        }
        {
            type = "command";
            key = "    os age";
            keyColor = "magenta";
            text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
            type = "uptime";
            key = "  󰔛  uptime";
            keyColor = "magenta";
        }
        {
            type = "datetime";
            key = "  󰃰  date";
            keyColor = "magenta";
        }
        {
            type = "custom";
            format = "└────────────────────────────────────────────────────┘";
        }
        {
            type = "colors";
            paddingLeft = 2;
            symbol = "circle";
        }
      ];
    };
  };

}
