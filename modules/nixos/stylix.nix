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
      base00 = "#0f0e06";
      base01 = "#15140d";
      base02 = "#26211d";
      base03 = "#36322f";
      base04 = "#56524f";
      base05 = "#cfbcba";
      base06 = "#feeeca";
      base07 = "#f06a3f";
      base08 = "#ef656a";
      base09 = "#d0730f";
      base0A = "#c48702";
      base0B = "#2fa526";
      base0C = "#70a89f";
      base0D = "#379cf6";
      base0E = "#d570af";
      base0F = "#692a12";
    };

    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 40;
    };

  };

}
