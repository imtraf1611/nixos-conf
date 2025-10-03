{
  config,
  lib,
  ...
}: {
  config.var = {
    username = "imtraf";

    git = {
      username = "imtraf";
      email = "phamnam079202038134@gmail.com";
    };

    keyboardLayout = "us";
  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
