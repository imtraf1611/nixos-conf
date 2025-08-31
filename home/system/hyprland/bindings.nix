{ pkgs, ... }:
let
  totalWorkspaces = 9;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Kill active window
      "$mod, Q, killactive"

      # Bindings to open applications
      "$mod, C, exec, code" # Open VS Code
      "$mod, SPACE, exec, ghostty" # Open Ghostty terminal
      "$mod, G, exec, google-chrome-stable" # Open Chrome

      # Volume and Media Control
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 2%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 2%-"

      "$mod, Print, exec, caelestia screenshot"

      # Caelestia shell bindings
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
}
