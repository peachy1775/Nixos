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
    tree
    unzip
    wget
    zsh
    bottom

    # File-Managers
    xfce.thunar
    xfce.tumbler
    xfce.thunar-volman

    # Dev-Tools
    alejandra
    bat
    bfg-repo-cleaner
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

    # Teams
    teams-for-linux

  ];

}
