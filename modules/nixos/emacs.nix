{ inputs, config, pkgs, pkgs-unstable, ... }:

let

  nativeStdenv = pkgs-unstable.stdenv.override {
    hostPlatform = pkgs-unstable.stdenv.hostPlatform // {
      gcc = { arch = "znver4"; tune = "znver4"; };
    };
  };

  emacs31-pgtk-native = (pkgs-unstable.emacs31-pgtk.override {
    stdenv = nativeStdenv;
  });

in

{
  environment.systemPackages = [
    emacs31-pgtk-native

    pkgs.git
    pkgs.ispell
    pkgs.nixfmt
    pkgs.pandoc
    pkgs.ripgrep
    pkgs.wl-clipboard
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.iosevka
  ];
}
