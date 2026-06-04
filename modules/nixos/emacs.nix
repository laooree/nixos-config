{ inputs, config, pkgs, pkgs-unstable, ... }:

let
  nativeStdenv = pkgs-unstable.stdenv.override {
    hostPlatform = pkgs-unstable.stdenv.hostPlatform // {
      gcc = { arch = "znver4"; tune = "znver4"; };
    };
  };

  emacs31 = (pkgs-unstable.emacs-git-pgtk.override {
    stdenv = nativeStdenv;
  }).overrideAttrs (old: {
    src = pkgs-unstable.fetchFromGitHub {
      owner = "emacsmirror";
      repo = "emacs";
      rev = "07e02917eec4abb84ee8868636e30232c9b44466";
      sha256 = "1lmylv8p248kianfgd41wyv5vi5l41fjz80mni8jnwqi3zgb0qv4";
    };
  });
in

{
  environment.systemPackages = [
    emacs31

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
