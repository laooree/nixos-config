{  pkgs, config, lib, ... }:

{

  xdg.configFile."niri/config.kdl".source = ./sources/niri-config.kdl;

}
