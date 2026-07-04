{ ... }:
{
wayland.windowManager.hyprland = {
  enable = true;

  systemd.enable = true;

  extraConfig = "";
};

  home.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg.configFile."hypr/hyprland.lua".source =
    ./hyprland.lua;
}
