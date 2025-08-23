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
    libertinus
    libertine
    nerd-fonts.fira-mono
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.recursive-mono
    nerd-fonts.symbols-only
    noto-fonts-color-emoji
  ];
}
