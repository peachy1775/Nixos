{ ... }:
{
  home.file = {
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
}
