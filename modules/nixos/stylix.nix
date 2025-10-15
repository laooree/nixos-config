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

      base00 = "#202020";
      base01 = "#151515";
      base02 = "#303030";
      base03 = "#444444";
      base04 = "#666666";
      base05 = "#e4e4e4";
      base06 = "#f6f6f6";
      base07 = "#709970";

      base08 = "#a64b4b";
      base09 = "#b6875b";
      base0A = "#a69b5b";
      base0B = "#709970";
      base0C = "#5b9ca6";
      base0D = "#5b87a6";
      base0E = "#a65b87";
      base0F = "#735f87";

      base10 = "#5c3333";
      base11 = "#5c4633";
      base12 = "#5c5c33";
      base13 = "#335c5c";
      base14 = "#2a3c2a";
      base15 = "#33465c";
      base16 = "#46335c";
      base17 = "#5c3346";

    };

    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 40;
    };

  };

}
