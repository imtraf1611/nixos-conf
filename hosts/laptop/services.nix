{pkgs, ...}: {
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql;
    ensureDatabases = ["mydatabase"];
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      #...
      #type database DBuser origin-address auth-method
      local all       all     trust
      # ipv4
      host  all      all     127.0.0.1/32   trust
      # ipv6
      host all       all     ::1/128        trust
    '';
  };

  services.redis = {
    enable = true;
    package = pkgs.redis;
    bind = "127.0.0.1";
    port = 6379;
  };
}
