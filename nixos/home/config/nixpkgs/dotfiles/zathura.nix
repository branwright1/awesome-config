{ config, pkgs, ... }:

{
  programs = {
    zathura = {
      enable = true;
      package = pkgs.zathura;
      options = {
        default-fg = "#79695a";
        inputbar-fg = "#79695a";
        statusbar-fg = "#5d6051";
        default-bg = "#201e1a";
        inputbar-bg = "#201e1a";
        statusbar-bg = "#272520";
        font = "Dina 9";
        recolor-lightcolor = "#201e1a";
        recolor-darkcolor = "#79695a";
      };
      extraConfig = ''
        set recolor
        set recolor-keephue
      '';
    };
  };
}
