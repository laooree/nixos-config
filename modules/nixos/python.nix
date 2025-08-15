{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python313.withPackages (python-pkgs: with python-pkgs; [
      numpy
      dbus-python  # needed for get-eduroam.py
    ]))];
}
