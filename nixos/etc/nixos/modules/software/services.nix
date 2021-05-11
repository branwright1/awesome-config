{ config, pkgs, ... }:

{

  services = {
    dbus = {
      enable = true;
    };
  qemuGuest = {
      enable = true;
      package = pkgs.qemu;
    };
  };

}
