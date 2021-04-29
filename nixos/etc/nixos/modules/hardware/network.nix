{ config, pkgs, ... }:

{

  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
    };
    interfaces = {
      enp2s0 = {
        useDHCP = true;
      };
      wlp3s0 = {
        useDHCP = true;
      };
    };
  };

}