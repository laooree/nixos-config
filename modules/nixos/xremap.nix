{ inputs, config, pkgs, ...}:

{
  services.xremap = {
    enable = true;
    serviceMode = "user";
    userName = "laooree";
    config = {
      modmap = [
        {
          name = "betterCaps";
          remap = {
            "KEY_CAPSLOCK" = {
              "held" = "KEY_LEFTCTRL";
              "alone" = "KEY_ESC";
              "alone_timeout_millis" = 150;
            };
            "KEY_LEFTCTRL" = {
              "held" = "KEY_LEFTCTRL";
              "alone" = "KEY_CAPSLOCK";
              "alone_timeout_millis" = 150;
            };
          };
        }
      ];
    };
    # withWlroots = true;
    withGnome = true;
  };
}
