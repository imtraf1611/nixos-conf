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
      set fish_greeting # Disable greeting
    '';

    # Define custom Fish functions
    functions = {
      # Custom prompt function
      # echo '     ___       __________________              ________ '
      #   echo '    /   \___   \______    _______\   _____    /  _____/ '
      #   echo '   /    /   \__/   \/    /    __  \ /  __ \__/  /___    '
      #   echo '  /    /           /    /    /_/ _//  / / /_   ____/    '
      #   echo ' /    /    /|/    /    /   ___   \/  /_/ /_/  /         '
      #   echo ' \___/\___/  \___/\___/\__/   \__/\__,__/\___/          '

      fish_prompt = ''
        set -l nix_shell_info (
          if test -n "$IN_NIX_SHELL"
            echo -n "<nix-shell> "
          end
        )
        echo -n -s "$nix_shell_info ~>"
      '';
    };

    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      nrt = "sudo nixos-rebuild test";
      cls = "clear";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
    };

    # You can also add shellInit for other configurations if needed
    # shellInit = ''
    #   # Other fish configurations
    # '';
  };
}
