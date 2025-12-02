{
  config,
  pkgs,
  inputs,
  ...
}:

{

  # You can visit http://127.0.0.1:8384/
  # to configure it through the web interface

  # This is not working: using "-" instead of "--" for flags
  # Manually write the service
  # services.syncthing = {
  #   enable = true;
  #   package = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}.syncthing;
  #   openDefaultPorts = true;
  #   user = "laooree";
  #   dataDir = "/home/laooree";
  #   configDir = "/home/laooree/.config/syncthing";
  # };

  environment.systemPackages = with pkgs; [
    inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}.syncthing
  ];

  # Create a systemd service for Syncthing
  systemd.services.syncthing = {
    description = "Syncthing service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    environment = {
      STNORESTART = "yes";
      STNOUPGRADE = "yes";
    };

    serviceConfig = {
      User = "laooree";
      Group = "syncthing";
      ExecStart = ''
        ${pkgs.syncthing}/bin/syncthing \
          --no-browser \
          --gui-address=127.0.0.1:8384 \
          --config=/home/laooree/.config/syncthing \
          --data=/home/laooree/.config/syncthing \
          --allow-newer-config
      '';

      Restart = "on-failure";
      SuccessExitStatus = "3 4";
      RestartForceExitStatus = "3 4";

      # Security hardening
      CapabilityBoundingSet = [
        "~CAP_SYS_PTRACE"
        "~CAP_SYS_ADMIN"
        "~CAP_SETGID"
        "~CAP_SETUID"
        "~CAP_SETPCAP"
        "~CAP_SYS_TIME"
        "~CAP_KILL"
      ];

      NoNewPrivileges = true;
      PrivateDevices = true;
      PrivateMounts = true;
      PrivateTmp = true;
      PrivateUsers = true;
      ProtectControlGroups = true;
      ProtectHostname = true;
      ProtectKernelModules = true;
      ProtectKernelTunables = true;
      RestrictNamespaces = true;
      RestrictRealtime = true;
      RestrictSUIDSGID = true;
      MemoryDenyWriteExecute = true;
    };
  };

  # Ensure the syncthing group exists
  users.groups.syncthing = {};

  # Make sure the user is in the syncthing group
  users.users.laooree = {
    extraGroups = [ "syncthing" ];
  };

  # Enable lingering to start service at boot
  # and enable persistance on logout
  users.users.laooree.linger = true;

}
