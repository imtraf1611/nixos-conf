{
  pkgs,
  ...
}:
{
  gtk = {
    gtk4 = {
      enable = true;
    };
  };

  xdg.configFile = {
    "gtk-4.0" = {
      source = ./gtk-4;
      recursive = true;
    };
  };
}
