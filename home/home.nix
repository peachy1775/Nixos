{ pkgs, username, ... }:

{
  imports = [
    ./modules/hyprland.nix
    ./modules/stylixTargets.nix
    ./modules/fastfetch.nix
    ./modules/vscode.nix
    ./modules/neovim.nix
    ./modules/pkgs.nix
    ./modules/ghostty.nix
    ./modules/programs.nix
  ];

   home = {
    inherit username;
    homeDirectory = "/home/peaches";
    stateVersion = "24.11";

    sessionVariables = {
      EDITOR = "vscode";
      GIT_EDITOR = "vscode";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      GTK_USE_PORTAL = "1";

    };

    file = {

      ".config/starship.toml" = {
        source = ./config/starship.toml;
      };
      ".config/fastfetch/nixos.png" = {
        source = ./config/fastfetch/nixos.png;
      };
      ".config/waybar/config.jsonc" = {
        source = ./config/waybar/config.json;
      };
      ".config/waybar/style.css" = {
        source = ./config/waybar/style.css;
      };

    };

    packages = with pkgs; [];
  };

}
