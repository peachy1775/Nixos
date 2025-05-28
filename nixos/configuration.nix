{ pkgs, lib, ... }:

let
  myKernel = pkgs.linuxKernel.packages.linux_6_12;
in

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
  kernelPackages = myKernel;
  kernelModules = [ "v4l2loopback" ];
  extraModulePackages = with myKernel; [ v4l2loopback ];

  loader = {
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 5;
    efi.canTouchEfiVariables = true;
  };

  extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=0 card_label="VirtualCamera" exclusive_caps=1
  '';
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

  environment = {
    variables = {
      XCURSOR_THEME = "cattppuccin-mocha-lavender-cursors";
      GDK_SCALE = "2";
      GDK_DPI_SCALE = "2";
      QT_SCALE_FACTOR = "2";
      QT_AUTO_SCREEN_SCALE_FACTOR = "2";
      WLR_DPI = "192";
      GTK_USE_PORTAL = "1";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
    };
  };

  environment.etc."hosts".text = lib.mkForce ''
    127.0.0.1 localhost
    ::1 localhost
    127.0.0.2 peaches
    # VS Code core telemetry and update services
    0.0.0.0 az764295.vo.msecnd.net
    0.0.0.0 vscode-sync.trafficmanager.net
    0.0.0.0 vscode-update.azurewebsites.net
    0.0.0.0 telemetry.visualstudio.com
    0.0.0.0 settings-prod.api.visualstudio.com
    0.0.0.0 msedge.api.cdp.microsoft.com
    0.0.0.0 az416426.vo.msecnd.net
    0.0.0.0 vortex.data.microsoft.com
    #0.0.0.0 go.microsoft.com
    0.0.0.0 errors.edge.microsoft.com
    # Authentication and Microsoft account login
    #0.0.0.0 login.microsoftonline.com
    #0.0.0.0 login.live.com
    #0.0.0.0 aadcdn.msauth.net
    #0.0.0.0 aadcdn.msftauth.net
    # Extension gallery and assets
    0.0.0.0 gallerycdn.vsassets.io
    0.0.0.0 msassets.visualstudio.com
    # Optional - wildcard block (note: /etc/hosts doesn't support wildcards)
    # Use Pi-hole or custom DNS for these
    # *.events.data.microsoft.com  
  '';

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.pulseaudio.enable = false;

  # Input and Display
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  # VIRT
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # This is for USB to work in Thunar
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Creates Group libvirt to usb inside QEMU
  users.groups.libvirt = { };

  users.users.peaches = {
    isNormalUser = true;
    description = "peaches";
    shell = pkgs.nushell;
    extraGroups = [
      "networkmanager"
      "wheel"
      "storage"
      "libvirt"
      "video"
    ];

    packages = with pkgs; [
      hyprland
      pipewire
      pulseaudio
      qemu
      virt-manager
      wayland
      wireplumber
      xdg-desktop-portal-hyprland
      gvfs
      usbutils
      udiskie
      udisks
      polkit_gnome
      ntfs3g
      ocl-icd
      clinfo
    ];
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
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
  networking.firewall.enable = true;
  environment.etc."sbin/mount.ntfs".source = "${pkgs.ntfs3g}/bin/ntfs-3g";

  system.stateVersion = "24.11";
}
