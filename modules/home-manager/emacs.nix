{ config, pkgs, ... }:

{

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  home.packages = with pkgs; [
    ispell
  ];

}
