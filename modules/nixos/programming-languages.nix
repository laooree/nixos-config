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
    haskell.compiler.native-bignum.ghc967
    haskell-language-server
  ];
}
