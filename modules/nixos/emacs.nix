{ inputs, config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    (pkgs.emacs.overrideAttrs (old: {
      name = "emacs-31";
      version = "31.0.50";
      src = pkgs.fetchFromGitHub {
        owner = "emacs-mirror";
        repo = "emacs";
        rev = "7425e33287547b879c22c4f4ac1b7c78fcbdd6f9";
        sha256 = "sha256-BLnR5LjFLYDbaNXzVrgsUpqJy/h1Q7EVzDMiDGI3Tn4=";
      };
      buildInputs = old.buildInputs ++ [
        pkgs.autoconf
        pkgs.texinfo
      ];
      preConfigure = ''
    ./autogen.sh
  '';
      configureFlags = (old.configureFlags or []) ++ [
        "--prefix=${placeholder "out"}"
      ];
    }))

    # emacs

    git
    ispell
    nerd-fonts.arimo
    nerd-fonts.recursive-mono
    nerd-fonts.ubuntu
    nixfmt
    nodePackages_latest.nodejs
    pandoc
    ripgrep
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.recursive-mono
    nerd-fonts.tinos
    nerd-fonts.ubuntu
    noto-fonts-color-emoji
    nerd-fonts.victor-mono
  ];

}
