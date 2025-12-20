{ inputs, config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    (pkgs.emacs.overrideAttrs (old: {
      name = "emacs-31";
      version = "31.0.50";
      src = pkgs.fetchFromGitHub {
        owner = "emacs-mirror";
        repo = "emacs";
        rev = "cf2e676ecab42a3f2add728eca20bb23d2a73728";
        sha256 = "sha256-9aU1+yzKz9LBxPg2feYQDEb2qNZ6O92aX3GBEKHUoJw=";
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
