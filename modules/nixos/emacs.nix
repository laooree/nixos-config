{ inputs, config, pkgs, pkgs-unstable, ... }:

{
    environment.systemPackages = [
        pkgs-unstable.emacs-pgtk

        pkgs.git
        pkgs.ispell
        pkgs.nixfmt
        pkgs.pandoc
        pkgs.ripgrep
        pkgs.wl-clipboard
    ];

    fonts.packages = with pkgs; [
        nerd-fonts.adwaita-mono
        nerd-fonts.iosevka
        nerd-fonts.jetbrains-mono
        nerd-fonts.symbols-only
    ];
}
