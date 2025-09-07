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
      base01 = "#26211d";
      base02 = "#36322f";
      base03 = "#56524f";
      base04 = "#887c8a";
      base05 = "#cfbcba";
      base06 = "#feeeca";
      base07 = "#f06a3f";
      base08 = "#ef656a";
      base09 = "#d0730f";
      base0A = "#c48702";
      base0B = "#2fa526";
      base0C = "#4fb0cf";
      base0D = "#379cf6";
      base0E = "#d570af";
      base0F = "#cf9f7f";
      base10 = "#692a12";
      base11 = "#70a89f";
      base12 = "#702020";
      base13 = "#007800";
      base14 = "#b08940";
      base15 = "#1f2f8f";
      base16 = "#5f509f";
      base17 = "#00808f";
    };

    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 40;
    };

  };

}
