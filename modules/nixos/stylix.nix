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
      base00 = "#111111";
      base01 = "#222522";
      base02 = "#303230";
      base03 = "#505250";
      base04 = "#808f80";
      base05 = "#cfdfd5";
      base06 = "#d0ffe0";
      base07 = "#3fb83f";
      base08 = "#ef6560";
      base09 = "#e09a0f";
      base0A = "#d4aa02";
      base0B = "#3fb83f";
      base0C = "#6fc5ef";
      base0D = "#37aff6";
      base0E = "#d38faf";
      base0F = "#b7a07f";
      base10 = "#00552f";
      base11 = "#8fcfaf";
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
