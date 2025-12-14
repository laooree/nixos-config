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
      name = "Iosevka Nerd Font";
      size = 16;
    };
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 10;
      window_margin_width = 0;
      background_opacity = lib.mkForce 0.93;
      cursor_trail = 1;
      hide_window_decorations = true;
    };
    shellIntegration.enableZshIntegration = true;
    themeFile = "Modus_Vivendi";
  };

}
