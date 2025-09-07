{ config, lib, ... }:
{
  config.var = {
    hostname = "laptop";
    username = "imtraf";

    # Upgrade/GC opt-ins
    autoUpgrade = false;
    autoGarbageCollector = true;

    # NixOS config directory
    configDirectory = "/home/" + config.var.username + "/.config/nixos";

    # Git config
    git = {
      username = "imtraf1611";
      email = "phamnam079202038134@gmail.com";
    };

    # Locale & Keyboard
    location = "Vietnam";
    timeZone = "Asia/Ho_Chi_Minh";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";
    keyboardLayout = "us";
  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
}
