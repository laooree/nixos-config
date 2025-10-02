{
  config,
  pkgs,
  inputs,
  ...
}:

{

  # You can visit http://127.0.0.1:8384/
  # to configure it through the web interface
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "laooree";
    dataDir = "/home/laooree";
    configDir = "/home/laooree/.config/syncthing";
  };

}
