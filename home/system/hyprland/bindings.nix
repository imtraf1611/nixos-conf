{ pkgs, ... }:
let
  totalWorkspaces = 9;
in
{
  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        # Kill active window
        "$mod, Q, killactive"

        # Apps
        "$mod, C, exec, code"
        "$mod, SPACE, exec, ghostty"
        "$mod, Z, exec, zen"
        "$mod, E, exec, nautilus"

        # Swap windows
        "$mod SHIFT, H, swapwindow, l"
        "$mod SHIFT, L, swapwindow, r"
        "$mod SHIFT, K, swapwindow, u"
        "$mod SHIFT, J, swapwindow, d"

        # Resize mode
        "$mod SHIFT, R, submap, resize"

        # Volume & media
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 4%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 4%-"

        "$mod, Print, exec, caelestia screenshot"

        # Caelestia
        "$mod, RETURN, exec, caelestia shell drawers toggle launcher"
        "$mod, D, exec, caelestia shell drawers toggle dashboard"
        "$mod, S, exec, caelestia shell drawers toggle session"
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
          in
          [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        ) totalWorkspaces
      ));
    };

    extraConfig = ''
      # --- Resize submap (enter with $mod+SHIFT+R) ---
      submap = resize
      # Vim keys
      binde = , h, resizeactive, -20 0
      binde = , l, resizeactive,  20 0
      binde = , k, resizeactive,   0 -20
      binde = , j, resizeactive,   0  20
      # Arrow keys (optional)
      binde = , left,  resizeactive, -20 0
      binde = , right, resizeactive,  20 0
      binde = , up,    resizeactive,   0 -20
      binde = , down,  resizeactive,   0  20
      # Exit submap
      bind = , escape, submap, reset
      bind = , return, submap, reset
      submap = reset
    '';
  };
}
