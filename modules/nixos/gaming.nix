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
        whitelist = {
            laooree = "62d92a23-732a-4313-a24b-36b3c0d7ab45";
            SeaBee20 = "35e80a83-0cb3-4a2c-8db0-2223482726d9";
        };
        package = pkgs-unstable.minecraft-server;
        serverProperties = {
            pvp = false;
        };
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
