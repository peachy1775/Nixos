{ pkgs, username, ... }:

{
  imports = [
    ./modules/hyprland.nix
    ./modules/stylixTargets.nix
    ./modules/fastfetch.nix
    ./modules/vscode.nix
    ./modules/pkgs.nix
    ./modules/ghostty.nix
    ./modules/programs.nix
    ./modules/files.nix
  ];
xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;
  home = {
    inherit username;
    homeDirectory = "/home/peaches";
    stateVersion = "24.11";

    sessionVariables = {
      EDITOR = "nvim";
      GIT_EDITOR = "nvim";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      GTK_USE_PORTAL = "1";

    };
    packages = with pkgs; [ ];
  };

}

###  This Is Good To Run Every Week On Monday  ###

#sudo nix-collect-garbage -d
#sudo /run/current-system/bin/switch-to-configuration boot
