{
  config,
  pkgs,
  inputs,
  ...
}:

{

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
  environment.systemPackages = with pkgs; [
    pcsx2               # ps2
    desmume             # nintendo ds
    azahar              # nintendo 3ds
    ppsspp-sdl-wayland  # psp
    mgba                # gba
    dosbox              # dos

    superTux
  ];

}
