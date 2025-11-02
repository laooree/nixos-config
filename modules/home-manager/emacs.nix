{ config, pkgs, ... }:

{

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  home.packages = with pkgs; [
    ispell
    nerd-fonts.recursive-mono
    nerd-fonts.arimo
    nerd-fonts.ubuntu

    # needed for markdown-mode
    pandoc
  ];

}
