{ inputs, config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    (pkgs.emacs.overrideAttrs (old: {
      name = "emacs-31";
      version = "31.0.50";

      src = pkgs.fetchFromGitHub {
        owner = "emacs-mirror";
        repo = "emacs";
        rev = "27f0a3fd869d3a73074f2023584430f6a5fd1162";
        sha256 = "sha256-1e5qybetz3PXgy57LDRBPXhi8PgmiqqC5mv51K4LsYM=";
      };

      buildInputs = old.buildInputs ++ [
        # additionalDependencies
      ];
    }))

    # emacs

    git
    ispell
    nerd-fonts.arimo
    nerd-fonts.recursive-mono
    nerd-fonts.ubuntu
    nixfmt-rfc-style
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
