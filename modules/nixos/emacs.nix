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
      rev = "e4350c538f4a2a9f1199812bdb38c3d2b73f20e8";
      sha256 = "1lpcrwn9bri1nwv2c5g8pi6iw7vinl8a9l6mqx5y5dj2lng07vg5";
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
