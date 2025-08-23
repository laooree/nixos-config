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
      base08 = "#78834b";
      base09 = "#1f3a57";
      base0A = "#87ceeb";
      base0B = "#824040";
      base0C = "#c86448";
      base0D = "#c9a554";
      base0E = "#335533";
      base0F = "#bb7744";
    };

    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 40;
    };

  };

}
