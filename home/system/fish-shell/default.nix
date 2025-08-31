{
  inputs,
  config,
  pkgs,
  ...
}:
{
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
    ];

    interactiveShellInit = ''
      set fish_greeting # Disable greeting`
      fastfetch
    '';

    # Define custom Fish functions
    functions = {
      # Custom prompt function
      fish_greeting = ''
        echo '     ___       __________________              ________ '
        echo '    /   \___   \______    _______\   _____    /  _____/ '
        echo '   /    /   \__/   \/    /    __  \ /  __ \__/  /___    '
        echo '  /    /           /    /    /_/ _//  / / /_   ____/    '
        echo ' /    /    /|/    /    /   ___   \/  /_/ /_/  /         '
        echo ' \___/\___/  \___/\___/\__/   \__/\__,__/\___/          '
      '';
    };

    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      nrt = "sudo nixos-rebuild test";
      cls = "clear";
    };

    # You can also add shellInit for other configurations if needed
    # shellInit = ''
    #   # Other fish configurations
    # '';
  };
}
