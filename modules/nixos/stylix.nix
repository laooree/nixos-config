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
      base00 = "#222222";
      base01 = "#151515";
      base02 = "#333333";
      base03 = "#444444";
      base04 = "#666666";
      base05 = "#c2c2b0";
      base06 = "#eaeaea";
      base07 = "#6f975f";
      base08 = "#f86448";
      base09 = "#e88448";
      base0A = "#c9a554";
      base0B = "#6f975f";
      base0C = "#67aedb";
      base0D = "#1f5a9f";
      base0E = "#f46a9f";
      base0F = "#f49abf";
      base10 = "#252d1d";
    };

    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 40;
    };

  };

}
