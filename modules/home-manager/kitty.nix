{
  pkgs,
  config,
  ...
}:

{

  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font";
      size = 16;
    };
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 10;
    };
    themeFile = "everforest_dark_hard";
    shellIntegration.enableZshIntegration = true;
  };

}
