{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [

    # python
    (python313.withPackages (python-pkgs: with python-pkgs; [
      numpy
      dbus-python  # needed for get-eduroam.py
    ]))
    pyright

    # haskell
    haskell.packages.ghc967.ghc
    haskell.packages.ghc967.haskell-language-server

    # c
    gcc
    clang clang-tools

	# latex
	texliveFull
	texlab

    # typst
    typst
    typstyle
    tinymist

    # man pages
    man-pages
    man-pages-posix
    man
  ];


  # git options
  programs.git = {
    enable = true;
    package = pkgs.git;

    config = {
      init.defaultBranch = "main";
    };
  };

  documentation = {
    man.generateCaches = true;
    dev.enable = true;
  };

}
