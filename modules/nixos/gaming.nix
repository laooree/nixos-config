{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:

{

  ##### minecraft servers #####
  services.minecraft-server = {
    enable = true;
    eula = true;
    package = pkgs-unstable.minecraft-server;
  };

  ##### hardware acceleration #####
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = ["amdgpu"];


  ##### steam #####
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
  };

  ##### emulators #####
  environment.systemPackages = [
    pkgs.pcsx2               # ps2
    pkgs.desmume             # nintendo ds
    pkgs.azahar              # nintendo 3ds
    pkgs.ppsspp-sdl-wayland  # psp
    pkgs.mgba                # gba
    pkgs.dosbox              # dos

    pkgs.supertux

    pkgs.prismlauncher       # minecraft

  ];

  services.tailscale = {
    enable = true;
    package = pkgs-unstable.tailscale;
  };
  networking.firewall.trustedInterfaces = [ "tailscale0" ];

}
