{ config, pkgs, ... }:

{

  imports = [
    ./modules/hardware/display/Wayland.nix
    ./modules/hardware/display/X11.nix
    ./modules/hardware/boot.nix
    ./modules/hardware/config.nix
    ./modules/hardware/misc.nix
    ./modules/hardware/network.nix
    ./modules/software/fonts.nix
    ./modules/software/pkgs.nix
    ./modules/software/programs.nix
    ./modules/software/services.nix
    ./hardware-configuration.nix
  ];

  time = {
    timeZone = "Europe/Dublin";
  };

  users = {
    mutableUsers = true;
    defaultUserShell = pkgs.zsh;
    users = {
      bran = {
        isNormalUser = true;
        extraGroups = [ "wheel" "doas" "docker" "networkmanager" ];
        initialPassword = "password";
      };
    };
  };

  nix = {
    allowedUsers = [ "bran" ];
    autoOptimiseStore = true;
    checkConfig = true;
    gc = {
      automatic = true;
      dates = "weekly";
    };
    optimise = {
      automatic = true;
    };
    useSandbox = false;
  };

  system = {
    stateVersion = "21.05";
  };

}
