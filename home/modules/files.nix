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
      ".config/helix/settings.toml" = {
      source =  ../config/helix/settings.toml;
    };
      ".config/helix/keymap.toml" = {
      source = ../config/helix/keymap.toml;
    };
  };
}
