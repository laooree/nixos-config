{ inputs, config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    emacs

    git
    ispell
    nixfmt
    nodePackages_latest.nodejs
    pandoc
    ripgrep
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.iosevka
  ];

}
