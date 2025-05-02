{ pkgs, config, ... }:

{
  imports = [
    ./hyprland.nix
  ];
  home = {
    #username = "peaches";
    #homeDirectory = "/home/peaches";
    stateVersion = "24.11";
    sessionVariables = {
      EDITOR = "nvim";
      GIT_EDITOR = "nvim";
    };

    file = {};
    
    packages = with pkgs; [
  
     ];

    };
  
  programs = {
    git.enable = true;
    git.userName = "peachy1775";
    git.userEmail = "Peachy1775@pm.me";
    zed-editor.enable = true;
  };
}
