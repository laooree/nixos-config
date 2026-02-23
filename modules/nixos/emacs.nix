{ inputs, config, pkgs, ... }:

let

  emacs-from-source = pkgs.stdenv.mkDerivation {
    name = "emacs-head";

    src = pkgs.fetchFromGitHub {
      owner = "emacs-mirror";
      repo = "emacs";
      rev = "emacs-30.2";
      sha256 = "sha256-3Lfb3HqdlXqSnwJfxe7npa4GGR9djldy8bKRpkQCdSA=";
    };

    buildInputs = with pkgs; [
      # necessary for minimal build
      gcc
      gnumake
      autoconf
      texinfo
      gnutls
      pkg-config
      libgccjit
      ncurses
      gtk3
      glib
    ];

    preConfigure = "./autogen.sh";

    configureFlags = [
      "--with-native-comp=aot"
      "--with-pgtk"
    ];
  };

in

{

  environment.systemPackages = with pkgs; [
    emacs-from-source

    git
    ispell
    nixfmt
    nodePackages_latest.nodejs
    pandoc
    ripgrep
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.iosevka
  ];

}
