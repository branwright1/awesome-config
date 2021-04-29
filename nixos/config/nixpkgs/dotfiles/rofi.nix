{ config, pkgs, ... }:

{

  programs = {
    rofi = {
      enable = true;
      package = pkgs.rofi;
      font = "Dina 9";
      extraConfig = {
        show-icons = false;
        sidebar-mode = true;
        display-window = "Windows";
        display-run = "Commands";
        display-ssh = "Servers";
        display-drun = "Apps";
      };
      theme = ".config/nixpkgs/dotfiles/rofi-themes/sidetab-tlou2.rasi";
    };
  };

}
