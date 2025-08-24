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
      base02 = "#1c1c1c";
      base03 = "#444444";
      base04 = "#666666";
      base05 = "#c2c2b0";
      base06 = "#eaeaea";
      base07 = "#5f875f";
      base08 = "#824040";
      base09 = "#bb7744";
      base0A = "#c9a554";
      base0B = "#5f875f";
      base0C = "#78834b";
      base0D = "#87ceeb";
      base0E = "#c86448";
      base0F = "#b36d43";
    };

    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 40;
    };

  };

}
