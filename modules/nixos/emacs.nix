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
      rev = "24879846852a577a348eb45c935ac2b31b632d94";
      sha256 = "0f7p6vnfdy664nf1lgz346w5lf8jnfrsn1ylnaa2dmrv0qn7v19y";
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
