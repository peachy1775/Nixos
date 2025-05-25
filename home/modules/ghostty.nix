{ pkgs, ... }:
{

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "ENCOM";
      background-opacity = 0.8;
      background-blur = true;
    };
  };
}
#tokyonight-storm
#catppuccin-mocha