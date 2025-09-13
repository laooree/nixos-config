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
    libertine
    libertinus
    nerd-fonts.fira-mono
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term-slab
    nerd-fonts.roboto-mono
    nerd-fonts.symbols-only
    noto-fonts-color-emoji
  ];
}
