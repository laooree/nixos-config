{ inputs, config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    emacs

    git
    ispell
    nerd-fonts.arimo
    nerd-fonts.recursive-mono
    nerd-fonts.ubuntu
    nixfmt
    nodePackages_latest.nodejs
    pandoc
    ripgrep
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.recursive-mono
    nerd-fonts.tinos
    nerd-fonts.ubuntu
    noto-fonts-color-emoji
    nerd-fonts.victor-mono
  ];

}
