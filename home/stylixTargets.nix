{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ./config/.wallpapers/anom.jpg;
    targets = {
      starship.enable = false;
      spicetify.enable = false;
      qt.enable = false;
      hyprland.enable = false;
      #zed.enable = true;
      vscode.enable = false;
      vencord.enable = false;
      vesktop.enable = true;
      nixcord.enable = true;
      emacs.enable = true;
    };
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono Nerd Font";
      };
    };
  };
}
