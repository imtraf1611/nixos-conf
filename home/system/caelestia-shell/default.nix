{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [ inputs.caelestia-shell.homeManagerModules.default ];

  programs.caelestia = {
    enable = true;
    settings = {
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> d0db58d2a79011720232b6b1d42f582909bc7d19
      appearance = {
        font = {
          family = {
            mono = "JetBrains Mono";
          };
          size = {
            scale = 1;
          };
        };
      };
<<<<<<< HEAD
>>>>>>> d0db58d (add assets)
=======
>>>>>>> d0db58d2a79011720232b6b1d42f582909bc7d19
      bar = {
        status = {

        };
        persistent = true;
        showOnHover = true;
      };
      paths = {
        mediaGif = "root:/assets/bongocat.gif";
<<<<<<< HEAD
<<<<<<< HEAD
        sessionGif = "~/Pictures/Gifs/kurukuru.gif";
=======
        sessionGif = "~/Pictures/Gifs/jingliu.gif";
>>>>>>> d0db58d (add assets)
=======
        sessionGif = "~/Pictures/Gifs/jingliu.gif";
>>>>>>> d0db58d2a79011720232b6b1d42f582909bc7d19
        wallpaperDir = "~/Pictures/Wallpapers";
      };
      border = {
        rounding = 12;
        thickness = 8;
      };
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
