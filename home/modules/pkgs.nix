{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # -------------------------
    # FUN / TERMINAL TOYS
    # -------------------------
    aalib
    asciiquarium
    bb
    cmatrix
    nyancat
    pipes
    screenfetch
    sl

    # -------------------------
    # BROWSERS
    # -------------------------
    brave
    chromium

    # -------------------------
    # HYPRLAND (KEEP FOR FUTURE SWITCH)
    # -------------------------
    hyprshot
    awww
    waybar
    wl-clipboard
    wl-clipboard-x11
    wofi
    waypaper
    wayle

    # -------------------------
    # AUDIO / MEDIA / VIDEO
    # -------------------------
    pavucontrol
    playerctl
    droidcam
    android-tools
    v4l-utils
    vlc
    mpv
    ffmpeg

    # -------------------------
    # SYSTEM UTILITIES (USER-LEVEL ONLY)
    # -------------------------
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
    bottom
    pandoc

    # -------------------------
    # FILE MANAGERS
    # -------------------------
    thunar
    tumbler
    thunar-volman
    gparted
    kitty

    # -------------------------
    # DEV TOOLS
    # -------------------------
    alejandra
    bat
    carapace
    git
    nil
    nixd
    nushellPlugins.polars
    ripgrep
    pyright

    # -------------------------
    # PROTON APPS
    # -------------------------
    proton-pass
    protonmail-desktop
    proton-vpn

    # -------------------------
    # IMAGE / GRAPHICS
    # -------------------------
    imv
    spice-gtk

    # -------------------------
    # MISC APPS
    # -------------------------
    gtk3
    teams-for-linux
    papirus-icon-theme
    libreoffice
    obsidian
  ];
}
