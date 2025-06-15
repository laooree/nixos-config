{
  inputs,
  config,
  pkgs,
  ...
}:

{
  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;

  fonts.packages = with pkgs; [
    libertinus
    nerd-fonts.fira-mono
    nerd-fonts.iosevka
    nerd-fonts.recursive-mono
    nerd-fonts.symbols-only
    nerd-fonts.zed-mono
    noto-fonts-color-emoji
  ];
}
