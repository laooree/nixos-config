{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python313.withPackages (python-pkgs: with python-pkgs; [
      beautifulsoup4
      matplotlib
      numpy
      requests

      # needed for get-eduroam.py
      dbus-python
    ]))];
}
