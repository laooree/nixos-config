{ config, pkgs, inputs, ... }:

{

  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableKvm = true;
      addNetworkInterface = false;
    };

    # Guest additions
    guest = {
      enable = false;
      dragAndDrop = false;
      seamless = false;
    };
  };

  users.extraGroups.vboxusers.members = [ "laooree" ];

}
