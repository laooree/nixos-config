{
  pkgs,
  config,
  lib,
  ...
}:

{

  programs.kitty = {
    enable = true;
    font = lib.mkForce {
      package = pkgs.nerd-fonts.recursive-mono;
      name = "AdwaitaMono Nerd Font";
      size = 16;
    };
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 0;
      window_margin_width = 0;
      background_opacity = lib.mkForce 0.95;
      cursor_trail = 1;
      cursor_shape = "block";
      hide_window_decorations = true;
      disable_ligatures = "cursor";
    };
    shellIntegration.enableZshIntegration = false;
    # themeFile = "doric-obsidian";

    extraConfig = ''
      # doric-obsidian theme
    background            #181818
    foreground             #e7e7e7
    selection_background   #3a3a3a
    selection_foreground   #e7e7e7

    cursor                 #eeddbb
    cursor_text_color      #181818

    url_color              #9fbfe7

    active_border_color    #727272
    inactive_border_color  #505050
    bell_border_color      #c0b080

    tab_bar_background     #181818
    active_tab_background  #432f2a
    active_tab_foreground  #b59487
    inactive_tab_background #181818
    inactive_tab_foreground #969696

    color0  #2f2f2f
    color8  #505050
    color1  #eca28f
    color9  #eca28f
    color2  #b9d0aa
    color10 #b9d0aa
    color3  #c0b080
    color11 #c0b080
    color4  #9fbfe7
    color12 #9fbfe7
    color5  #e9acbf
    color13 #e9acbf
    color6  #a0c0d0
    color14 #a0c0d0
    color7  #bcbcbc
    color15 #e7e7e7
    '';
  };

}
