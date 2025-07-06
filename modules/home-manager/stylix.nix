{
  pkgs,
  config,
  ...
}:

{

  stylix = {
    enable = true;
    targets = {
      emacs.enable = true;
    };
  };

  # Export colors in a file to be sourced
  home.file.".config/stylix/colors_env" = {
    text = ''
      export COLOR_BASE00=#${config.lib.stylix.colors.base00}
      export COLOR_BASE01=#${config.lib.stylix.colors.base01}
      export COLOR_BASE02=#${config.lib.stylix.colors.base02}
      export COLOR_BASE03=#${config.lib.stylix.colors.base03}
      export COLOR_BASE04=#${config.lib.stylix.colors.base04}
      export COLOR_BASE05=#${config.lib.stylix.colors.base05}
      export COLOR_BASE06=#${config.lib.stylix.colors.base06}
      export COLOR_BASE07=#${config.lib.stylix.colors.base07}
      export COLOR_BASE08=#${config.lib.stylix.colors.base08}
      export COLOR_BASE09=#${config.lib.stylix.colors.base09}
      export COLOR_BASE0A=#${config.lib.stylix.colors.base0A}
      export COLOR_BASE0B=#${config.lib.stylix.colors.base0B}
      export COLOR_BASE0C=#${config.lib.stylix.colors.base0C}
      export COLOR_BASE0D=#${config.lib.stylix.colors.base0D}
      export COLOR_BASE0E=#${config.lib.stylix.colors.base0E}
      export COLOR_BASE0F=#${config.lib.stylix.colors.base0F}
    '';
  };

}
