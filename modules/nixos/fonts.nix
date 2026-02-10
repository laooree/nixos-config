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
    cm_unicode
    dinish
    fira-sans
    fira-math
    libertine
    libertinus
    nerd-fonts.arimo
    nerd-fonts.fira-mono
    nerd-fonts.iosevka
    nerd-fonts.recursive-mono
    nerd-fonts.roboto-mono
    nerd-fonts.symbols-only
    nerd-fonts.tinos
    nerd-fonts.ubuntu
    noto-fonts-color-emoji
  ];
}
