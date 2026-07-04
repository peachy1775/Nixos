{ ... }:
{

  home.file = {
    ".config/starship.toml" = {
      source = ../config/starship.toml;
    };
    ".config/fastfetch/nixos.png" = {
      source = ../config/fastfetch/nixos.png;
    };
    ".config/yazi/yazi.toml" = {
      source = ../config/yazi/yazi.toml;
    };
  };
}
