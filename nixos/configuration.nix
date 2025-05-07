{ pkgs, ... }:

{
  imports = [
    ./stylix.nix
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_6_12;
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 5;
      efi.canTouchEfiVariables = true;
    };
  };

  security.polkit.enable = true;

  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
    xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      videoDrivers = [ "intel" ];
      xkb = {
        layout = "us";
        options = "eurosign:e,caps:escape";
      };
    };
  };

  networking = {
    hostName = "peaches";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";
  services.getty.autologinUser = "peaches";

  nixpkgs.config.allowUnfree = true;

  environment.variables = {
    GDK_SCALE = "1";
    GDK_DPI_SCALE = "1.5";
    QT_SCALE_FACTOR = "1.5";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    XCURSOR_SIZE = "48";
    WLR_DPI = "192";
    GTK_USE_PORTAL = "1"; # Enable GTK portals for filechooser
    XDG_CURRENT_DESKTOP = "Hyprland"; # Set Hyprland as the current desktop
  };

  # BLUETOOTH #
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.pulseaudio.enable = false;

  # input and display
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr ];
  };

  # VIRT
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  users.users.peaches = {
    isNormalUser = true;
    description = "peaches";
    shell = pkgs.nushell;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      zsh
      mpv
      tmux
      virt-manager
      qemu
      proton-pass
      protonmail-desktop
      wofi
      ghostty
      pavucontrol
      fzf
      killall
      file
      xfce.thunar
      playerctl
    ];
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      font-awesome
      corefonts
      vistafonts
      noto-fonts
      noto-fonts-emoji
      cantarell-fonts
    ];
    fontconfig.defaultFonts.monospace = [ "JetBrainsMono" ];
  };

  programs.hyprland.enable = true;

  system.stateVersion = "24.11";
}
