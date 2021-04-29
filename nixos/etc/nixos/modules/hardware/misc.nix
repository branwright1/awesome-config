{ config, pkgs, ... }:

{

  sound = {
    enable = true;
    mediaKeys = {
      enable = true;
      volumeStep = "5%";
    };
  };

  security = {
    polkit = { enable = true; };
    doas = {
      enable = true;
      extraRules = [{
        groups = [ "doas" ];
        noPass = true;
        keepEnv = true;
      }];
    };
  };

  i18n = { defaultLocale = "en_GB.UTF-8"; };

  console = { keyMap = "pl"; };

}
