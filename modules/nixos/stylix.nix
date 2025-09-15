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

      base00 = "#24211e";
      base01 = "#161413";
      base02 = "#38332e";
      base03 = "#433d37";
      base04 = "#655c53";
      base05 = "#c7c2bc";
      base06 = "#eaeaea";
      base07 = "#5f875f";

      base08 = "#a66b6b";
      base09 = "#a6875b";
      base0A = "#a69b5b";
      base0B = "#5f875f";
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
