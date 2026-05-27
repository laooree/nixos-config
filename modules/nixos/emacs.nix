{ inputs, config, pkgs, pkgs-unstable, ... }:

let
  emacs31 = pkgs-unstable.emacs-git-pgtk.overrideAttrs (old: {
    src = pkgs-unstable.fetchFromGitHub {
      owner = "emacsmirror";
      repo = "emacs";
      rev = "02897e208d005956f84aa228f4f298f260133896";
      sha256 = "sha256-V4L6cqmaSUNHnC7+Vk8HUMk97T0/4RUTfvycvWV5Zps=";
    };
  });
in

{
  environment.systemPackages = [
    emacs31

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
