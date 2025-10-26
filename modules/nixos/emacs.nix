{ inputs, config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    emacs

    # configuration dependencies
    ripgrep
    git

    # formatters
    nixfmt-rfc-style
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.symbols-only
  ];

}
