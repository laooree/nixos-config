{
  pkgs,
  config,
  lib,
  ...
}:

{

  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font";
      size = 18;
    };
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 10;
      background_opacity = lib.mkForce 0.95;
      cursor_trail = 1;
    };
    shellIntegration.enableZshIntegration = true;
    extraConfig = ''
      #################
      ##### Theme #####
      #################
      foreground                      #c2c2b0
      background                      #222222
      selection_foreground            #c2c2b0
      selection_background            #43492a

      cursor                          #c2c2b0
      cursor_text_color               #222222
      cursor_trail_color              none

      url_color                       #87ceeb

      active_border_color             #5f875f
      inactive_border_color           #444444
      bell_border_color               #c86448
      visual_bell_color               none

      wayland_titlebar_color          system
      macos_titlebar_color            system

      active_tab_foreground           #c2c2b0
      active_tab_background           #222222
      inactive_tab_foreground         #444444
      inactive_tab_background         #222222
      tab_bar_background              none
      tab_bar_margin_color            none

      mark1_foreground #222222
      mark1_background #87ceeb
      mark2_foreground #222222
      mark2_background #fbec9f
      mark3_foreground #222222
      mark3_background #c86448

      #: black
      color0 #222222
      color8 #666666

      #: red
      color1 #824040
      color9 #824040

      #: green
      color2  #5f875f
      color10 #5f875f

      #: yellow
      color3  #fbec9f
      color11 #fbec9f

      #: blue
      color4  #87ceeb
      color12 #87ceeb

      #: magenta
      color5  #d699b6
      color13 #d699b6

      #: cyan
      color6  #7fbbb3
      color14 #7fbbb3

      #: white
      color7  #eaeaea
      color15 #eaeaea
    '';
  };

  # theme
  home.file."home/laooree/.config/kitty/themes/miasma.conf".text = ''
    #: The basic colors

    foreground                      #c2c2b0
    background                      #222222
    selection_foreground            #c2c2b0
    selection_background            #43492a

    #: Cursor colors

    cursor                          #c2c2b0
    cursor_text_color               #222222
    cursor_trail_color              none


    #: URL underline color when hovering with mouse

    url_color                       #87ceeb


    #: kitty window border colors and terminal bell colors

    active_border_color             #5f875f
    inactive_border_color           #444444
    bell_border_color               #c86448
    visual_bell_color               none


    #: OS Window titlebar colors

    wayland_titlebar_color          system
    macos_titlebar_color            system


    #: Tab bar colors

    active_tab_foreground           #c2c2b0
    active_tab_background           #222222
    inactive_tab_foreground         #444444
    inactive_tab_background         #222222
    tab_bar_background              none
    tab_bar_margin_color            none


    #: Colors for marks (marked text in the terminal)

    mark1_foreground #222222
    mark1_background #87ceeb
    mark2_foreground #222222
    mark2_background #fbec9f
    mark3_foreground #222222
    mark3_background #c86448

    #: The basic 16 colors

    #: black
    color0  #222222
    color8  #666666

    #: red
    color1  #824040
    color9  #824040

    #: green
    color2  #5f875f
    color10 #5f875f

    #: yellow
    color3  #fbec9f
    color11 #fbec9f

    #: blue
    color4  #87ceeb
    color12 #87ceeb

    #: magenta
    color5  #d699b6
    color13 #d699b6

    #: cyan
    color6  #7fbbb3
    color14 #7fbbb3

    #: white
    color7  #eaeaea
    color15 #eaeaea
  '';

}
