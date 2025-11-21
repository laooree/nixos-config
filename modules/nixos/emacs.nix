{ inputs, config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    (pkgs.emacs.overrideAttrs (old: {
      name = "emacs-31";
      version = "31.0.50";  # or whatever prerelease version

      src = pkgs.fetchFromGitHub {
        owner = "emacs-mirror";
        repo = "emacs";
        rev = "918b9f04f422efb7b614a9f71b004523a39d7674";
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
    nerd-fonts.iosevka
    nerd-fonts.symbols-only
  ];

}
