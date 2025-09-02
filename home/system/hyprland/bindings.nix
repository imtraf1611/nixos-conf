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
        "$kbTerminal, exec, $terminal"
        "$kbBrowser, exec, $browser"
        "$kbEditor, exec, $editor"
        "$kbFileExplorer, exec, $fileExplorer"

        # Caelestia
        "$mod, RETURN, exec, caelestia shell drawers toggle launcher"
        "$mod, D, exec, caelestia shell drawers toggle dashboard"
        "$mod, S, exec, caelestia shell drawers toggle session"
        # Screenshots
        "$mod, Print, exec, caelestia screenshot --region"
        "$mod SHIFT, Print, exec, caelestia screenshot --freeze"

        # Window actions
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod SHIFT, left, movewindow , l"
        "$mod SHIFT, right, movewindow , r"
        "$mod SHIFT, up, movewindow , u"
        "$mod SHIFT, down, movewindow , d"
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
      ))
      ++ [
        # Scroll through existing workspaces with mainMod + scroll
        "$mod, mouse_up, workspace, +1"
        "$mod, mouse_down, workspace, -1"
      ];
    };

    extraConfig = ''
      # Volume
      bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      bindel = ,XF86MonBrightnessUp, exec, brightnessctl s 10%+
      bindel = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-

      # Requires playerctl
      bindl = , XF86AudioNext, exec, playerctl next
      bindl = , XF86AudioPause, exec, playerctl play-pause
      bindl = , XF86AudioPlay, exec, playerctl play-pause
      bindl = , XF86AudioPrev, exec, playerctl previous

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mod, mouse:272, movewindow
      bindm = $mod, mouse:273, resizewindow
    '';
  };
}
