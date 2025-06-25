{
  pkgs,
  config,
  ...
}:

{

  stylix = {
    enable = true;
    targets = {
      emacs.enable = true;
    };
  };

}
