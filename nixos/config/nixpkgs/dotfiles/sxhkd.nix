{ config, pkgs, ... }:

{

  services = {
    sxhkd = {
      enable = false;
      package = pkgs.sxhkd;
      keybindings = {
        # reload sxhkd
        "alt + escape" = "pkill -USR1 -x sxhkd";
        # bind apps
        "alt + return" = "alacritty";
        "shoft + space" = "rofi -show";
        "Print" = "flameshot gui";
        # bind layouts
        "super + d" = "sh ~/.hlwm-utils/dwindle";
        "super + m" = "sh ~/.hlwm-utils/centered-master";
        "super + v" = "sh ~/.hlwm-utils/vertical";
        "super + r" = "sh ~/.hlwm-utils/reset";
        "super + p" = "sh ~/.hlwm-utils/hlwm-menu";
        # herbstluftwm
        "alt + shift + r" = "herbstclient reload";
        "alt + shift + q" = "herbstclient close";
        "alt + shift + e" = "herbstclient quit";
        # focus clients
        "alt + Left" = "herbstclient focus left";
        "alt + Down" = "herbstclient focus down";
        "alt + Up" = "herbstlicent focus up";
        "alt + Right" = "herbstclient focus right";
        # moving clients
        "alt + shift + Left" = "herbstclient shift left";
        "alt + shift + Down" = "herbstclient shift down";
        "alt + shift + Up" = "herbstlicent shift up";
        "alt + shift + Right" = "herbstclient shift right";
        # spliting frames
        "alt + super + Left" = "herbstclient split left 0.5";
        "alt + super + Down" = "herbstclient split down 0.5";
        "alt + super + Up" = "herbstclient split up 0.5";
        "alt + super + Right" = "herbstclient split right 0.5";
        "alt + control + Space" = "herbstclient split explode 0.5";
        # resizing frames and floating clients
        "alt + control + Left" = "herbstclient resize left 0.1";
        "alt + control + Down" = "herbstclient resize down 0.1";
        "alt + control + Up" = "herbstclient resize up 0.1";
        "alt + control + Right" = "herbstclient resize right 0.1";
        # layouting
        "alt + r" = "herbstclient remove";
        "alt + s" = "herbstclient floating toggle";
        "alt + f" = "herbstclient fulscreen toggle";
        "alt + shift + f" = "herbstclient set_attr clients.floating toggle";
        "alt + p" = "herbstclient pseudotile toggle";
      };
    };
    flameshot = {
      enable = true;
    };
  };

}
