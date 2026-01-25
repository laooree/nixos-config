{ inputs, config, pkgs, ...}:

{

  virtualisation.podman = {
    enable = true;
    package = pkgs.podman;
    dockerCompat = true;
  };

  environment.systemPackages = with pkgs; [
    distrobox
    distroshelf
  ];

}
