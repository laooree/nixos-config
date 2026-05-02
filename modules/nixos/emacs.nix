{ inputs, config, pkgs, pkgs-unstable, ... }:

{

  environment.systemPackages = [
    pkgs-unstable.emacs-pgtk

    pkgs.git
    pkgs.ispell
    pkgs.nixfmt
    pkgs.nodePackages_latest.nodejs
    pkgs.pandoc
    pkgs.ripgrep
    pkgs.wl-clipboard
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.iosevka
  ];

}
