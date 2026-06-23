{ pkgs, ... }:
{

  home.packages = with pkgs; [
    # Fun-Terminal
    aalib
    asciiquarium
    bb
    cmatrix
    nyancat
    pipes
    screenfetch
    sl

    # Browsers
    brave
    chromium

    # Hyprland
    hyprshot
    killall
    swww
    waybar
    wl-clipboard
    wl-clipboard-x11
    wofi
    xorg.xprop
    waypaper

    # Audio-Media-Webcam
    pavucontrol
    playerctl
    droidcam
    android-tools
    v4l-utils
    vlc
    mpv
    ffmpeg

    # System-Utils
    blueman
    brightnessctl
    btop
    curl
    dunst
    file
    fzf
    gdk-pixbuf
    gzip
    networkmanagerapplet
    tree
    unzip
    wget
    zsh
    bottom
    nssmdns
    pandoc

    # File-Managers
    xfce.thunar
    xfce.tumbler
    xfce.thunar-volman
    gparted
    xorg.xhost
    kitty

    # Dev-Tools
    alejandra
    bat
    carapace
    git
    nil
    nixd
    nushellPlugins.polars
    ripgrep

    # Proton
    proton-pass
    protonmail-desktop
    protonvpn-gui

    # Image-Graphics
    imv
    spice-gtk

    # Misc
    gtk3
    pyright

    # Teams
    teams-for-linux

    # ICONS
    papirus-icon-theme

    # Office
    libreoffice

    # Note Taking
    obsidian

  ];

}
