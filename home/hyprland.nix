{ config, pkgs, lib, ... }: {
  imports = [ ];
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = "DP-4,preferred,auto,2";

      # Auto-launing
      exec-once = [
        "hyprctl dispatch workspace 1"
        "hyprctl dispatch workspace 2"
        "hyprctl dispatch workspace 3"
        "hyprctl dispatch workspace 4"
        "hyprctl dispatch workspace 5"
        "ghostty &"
        "brave &"
        "waybar &"
        "swww-daemon &"
      ];

      # General settings
      general = {
        gaps_in = 2;
        gaps_out = 5;
        "col.active_border" = "rgb(7800e3) rgb(c452e0) 45deg";
        "col.inactive_border" = "rgba(00000000)";
      };

      decoration = {
        rounding = 15;
        blur = {
          enabled = true;
          size = 10;
          passes = 2;
          noise = 0.1;
        };
      };

      animations = { enabled = true; };

      # Inputs (keyboard & mouse)
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0.5;
        touchpad = { natural_scroll = true; };
      };

      render = { explicit_sync = false; };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Keybinds
      bind = [
        "SUPER, Q, exec, ghostty"
        "SUPER, Z, exec, zeditor"
        "SUPER, D, exec, vesktop"
        "SUPER, T, exec, thunar"
        "SUPER, Space, exec, wofi --show drun"
        "SUPER, B, exec, brave"
        "SUPER, C, killactive"
        "SUPER, P, exec, proton-pass"
        "SUPER, M, exec, proton-mail"
        "SUPER, S, exec, teams-for-linux"
        "SUPER ALT SHIFT, Q, exit"
        "ALT LSHIFT, F10, exec, playerctl previous"
        "ALT LSHIFT, F11, exec, playerctl play-pause"
        "ALT LSHIFT, F12, exec, playerctl next"
        "SUPER LSHIFT, S, exec, nu ~/.config/hypr/scripts/screenshot.nu"
        "SUPER LSHIFT, Space, togglefloating"
        "SUPER, C, togglesplit"
        "ALT, Return, fullscreen"
        "SUPER, 1, workspace, 1"
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER, mouse_up, workspace, e-1"
        "SUPER, mouse_down, workspace, e+1"
        ", XF86AudioRaiseVolume, exec, vol --up"
        ", XF86AudioLowerVolume, exec, vol --down"
      ];
      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # Mouse bindings
      bindm =
        [ "SUPER, mouse:272, movewindow" "SUPER, mouse:273, resizewindow" ];

      windowrulev2 = [
        "pin, title:Picture-in-Picture"
        "float, title:Picture-in-Picture"
        "size 640 360, title:Picture-in-Picture"
        "pin, title:Picture-in-Picture"
      ];
    };
  };
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
