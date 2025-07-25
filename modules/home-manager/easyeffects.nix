{ config, input, pkgs, lib, ... }:

{

  services.easyeffects = {
    enable = true;
    package = pkgs.easyeffects;
  };

}
