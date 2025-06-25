{ config, pkgs, ... }:

{

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };
  
  home.packages = with pkgs; [
    # configuration dependencies
    libvterm
    ripgrep
    git
    nixfmt-rfc-style
  ];

}
