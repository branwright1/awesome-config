{ config, pkgs, ... }:

{

  programs = {
    dconf = {
      enable = true;
    };
    java = {
      enable = true;
      package = pkgs.jdk;
    };
    npm = {
      enable = true;
      npmrc = ''
        prefix = ''${HOME}/.npm
        color = true
      '';
    };
  };

}
