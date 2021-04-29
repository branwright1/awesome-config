{ config, pkgs, ... }:

{

  services = {
    dbus = {
      enable = true;
    };
    pipewire = {
      enable = true;
      package = pkgs.pipewire;
      alsa = {
        enable = true;
      };
    };
    qemuGuest = {
      enable = true;
      package = pkgs.qemu;
    };
  };

}
