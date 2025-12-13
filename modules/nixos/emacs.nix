{ inputs, config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    (pkgs.emacs.overrideAttrs (old: {
      name = "emacs-31";
      version = "31.0.50";
      src = pkgs.fetchFromGitHub {
        owner = "emacs-mirror";
        repo = "emacs";
        rev = "41ffeaec15b9a0f052de2d2e5eab23302c4ce46b";
        sha256 = "sha256-HZfQg7s2/coBbq3BLnFZFw3BTP/UzKhPpIX1ms0TPOE=";
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
