{ config, pkgs, ... }:

{

  programs = {
    mako = {
      enable = false;
      actions = true;
      sort = "-time";
      font = "Dina 10";
      height = "90";
      width = "280";
      margin = "32";
      padding = "8";
      maxIconSize = 40;
      layer = "overlay";
      anchor = "bottom-right";
      textColor = "#79695a";
      backgroundColor = "#201e1a";
      progressColor = "over #3E2D23";
      borderColor = "3E2D23";
      borderSize = 4;
      borderRadius = 0;
      defaultTimeout = 5000;
      extraConfig = ''
        [urgency=high]
        ignore-timeout=1'';
    };
  };

}
