{
  pkgs,
  config,
  inputs,
  ...
}:

{

  stylix = {

    enable = true;
    autoEnable = true;

    polarity = "dark";
    base16Scheme = {

      base00 = "#000000";
      base01 = "#1e1e1e";
      base02 = "#303030";
      base03 = "#535353";
      base04 = "#646464";
      base05 = "#ffffff";
      base06 = "#feacd0";
      base07 = "#00d3d0";

      base08 = "#ff5f59";
      base09 = "#db7b5f";
      base0A = "#d0bc00";
      base0B = "#44bc44";
      base0C = "#00d3d0";
      base0D = "#2fafff";
      base0E = "#b6a0ff";
      base0F = "#ff66ff";

    };

    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 40;
    };

  };

}
