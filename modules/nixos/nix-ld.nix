{
  options,
  pkgs,
  ...
}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Core system libraries
      stdenv.cc.cc
      glib
      dbus
      dbus-glib
      expat
      libelf

      # Security & cryptography
      nspr
      nss
      openssl

      # Printing
      cups

      # GUI toolkit libraries
      libdbusmenu-gtk3
      gtk3
      atk
      gdk-pixbuf
      pango
      cairo

      # Graphics & rendering
      libdrm
      mesa
      libGL
      libva
      libgbm

      # Input handling
      libxkbcommon

      # Audio
      alsa-lib
      pipewire

      # Font rendering
      fontconfig
      freetype

      # X11 core libraries
      xorg.libX11
      xorg.libxcb
      xorg.libXext
      xorg.libXfixes
      xorg.libXi
      xorg.libXtst
      xorg.libXrender

      # X11 window management
      xorg.libXcomposite
      xorg.libXdamage
      xorg.libXrandr
      xorg.libXinerama
      xorg.libXcursor
      xorg.libXScrnSaver

      # X11 graphics extensions
      xorg.libXxf86vm
      xorg.libxshmfence

      # X11 session management
      xorg.libSM
      xorg.libICE

      prisma-engines
      nodePackages.node-gyp
    ];
  };
}
