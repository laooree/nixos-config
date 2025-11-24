{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default

    # custom modules
    ./modules/nixos/distrobox.nix
    ./modules/nixos/emacs.nix
    ./modules/nixos/fonts.nix
    ./modules/nixos/gaming.nix
    ./modules/nixos/gnome.nix
    ./modules/nixos/programming-languages.nix
    ./modules/nixos/syncthing.nix
    ./modules/nixos/xremap.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "lambda"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # enable bluetooth
  hardware.bluetooth.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  programs.xwayland.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "it";
    variant = "";
  };

  # enable dconf
  programs.dconf.enable = true;

  # Configure console keymap
  console.keyMap = "it2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.laooree = {
    isNormalUser = true;
    description = "Andrea";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      #  thunderbird
    ];
    shell = pkgs.zsh;
  };

  # Enable zsh
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable xdg
  xdg = {
    mime.enable = true;
    portal.enable = true;
    menus.enable = true;
  };

  # set environment variables
  environment.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    PATH = [ "$HOME/.local/bin" ];
  };

  # Install firefox
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bluetui
    brave
    cava
    deadbeef-with-plugins
    discord
    easyeffects
    epy
    fzf
    gcc
    ghostscript
    gimp
    git
    imagemagick
    inkscape-with-extensions
    ipe
    kitty
    libreoffice
    matlab-language-server
    mullvad-browser
    neovim
    obs-studio
    onlyoffice-desktopeditors
    pcloud
    phinger-cursors
    pokemmo-installer
    qucs-s
    scilab-bin
    sl
    spotify
    telegram-desktop
    texliveFull texlab # latex + lsp
    tor-browser
    vlc
    xremap
    xyce-parallel
    zip
    zoom-us
  ];

  systemd.user.targets.graphical-session = {
    wantedBy = [ "default.target" ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."laooree" = import ./home.nix;
  };

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

}
