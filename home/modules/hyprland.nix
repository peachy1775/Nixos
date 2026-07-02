{ ... }:

{
  wayland.windowManager.hyprland.enable = true;

  home.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg.configFile."hypr/hyprland.lua".source =
    ./hyprland.lua;
}
