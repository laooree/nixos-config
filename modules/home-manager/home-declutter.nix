{
  pkgs,
  config,
  ...
}:


{

  home.packages = [ pkgs.xdg-ninja ];

  home.sessionVariables = {
    PULSE_COOKIE = "${config.xdg.dataHome}/pulse/cookie";
    PYTHON_HISTORY = "${config.xdg.dataHome}/python/history";
  };

}
