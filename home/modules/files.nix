{ ... }:
{
  home = {
    file = {
      ".config/yazi/yazi.toml".source = {
        ../config/yazi/yazi.toml;
      };
      ".config/yazi/keymap.toml".source = {
        ../config/yazi/keymap.toml;
      };
      ".config/yazi/theme.toml".source = {
        ../config/yazi/theme.toml;
      };
      ".config/starship.toml" = {
        source = ../config/starship.toml;
      };
      ".config/fastfetch/nixos.png" = {
        source = ../config/fastfetch/nixos.png;
      };
      ".config/waybar/config.jsonc" = {
        source = ../config/waybar/config.json;
      };
      ".config/waybar/style.css" = {
        source = ../config/waybar/style.css;
      };
    };
  };
}
