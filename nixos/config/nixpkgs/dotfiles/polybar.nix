{ config, pkgs, ... }:

{

  services = {
    polybar = {
      enable = false;
      package = pkgs.polybar;
      config = {
        "bar/bar" = {
          monitor = "HDMI-1";
          override-redirect = false;
          bottom = false;
          background = "#79695a";
          foreground = "#79695a";
          fixed-center = true;
          width = "100%";
          height = "30";
          radius = "1.0";
          padding-left = 1;
          padding-right = 1;
          offset-x = 0;
          offset-y = 0;
          line-size = 0;
          font = "Dina:style=Medium:pixelsize=12;2";
          modules-left = "herbstluftwm";
          modules-center = "spotify";
          modules-right = "network bettery date";
        };
        "module/herbstluftwm" = {
          type = internal/xworkspaces;

          pin-workspaces = false;
          enable-click = true;
          enable-scroll = true;
          reverse-scroll = true;

          format = <label-state>;
          label-monitor = "%name%";
          label-active = "%name%";
          label-active-foreground = "#5d6051";
          label-active-background = "#201e1a";
          label-active-padding = 1;

          label-occupied = "%name%";
          label-occupied-background = "#201e1a";
          label-occupied-padding = 1;

          label-urgent = "%name%";
          label-urgent-foreground = "#79695a";
          label-urgent-background = "#5d6051";
          label-urgent-padding = 1;

          label-empty = "%name%";
          label-empty-foreground = "#79695a";
          label-empty-padding = 1;
          format-foreground = "#574e4a";
          format-background = "#201e1a";
        };
        "module/spotify" = {
          type = custom/script;
          exec =
            "playerctl -p spotify metadata --format '{{artist}} - {{title}}'";
          exec-if = "pgrep spotify";
          format-foreground = "#79695a";
          format-padding = 0;
          format-prefix-padding = 1;
          format-prefix-foreground = "#5d6051";
          tail = true;
          interval = 2;
        };
        "module/date" = {
          type = internal/date;
          time = "%H:%M | %d/%m/%y";
          format = "<label>";
          format-prefix = "Date:";
          format-prefix-padding = 1;
          format-foreground = "#5d6051";
          format-padding = 1;
          label = "%time%";
          label-foreground = "#79695a";
        };
        "module/netowrk" = {
          type = internal/network;
          interface = "wlp3s0";
          interval = 3.0;
          unknown-as-up = true;
          accumulate-stats = true;
          format-connected = "Wifi: <label-connected>";
          label-connected = "%essid%";
          format-connected-padding = 2;
          format-connected-foreground = "#5d6051";
          label-connected-foreground = "#79695a";
        };
        "module/alsa" = {
          type = internal/alsa;
          format-volume = "Volume: <label-volume>";
          label-muted = "muted";
          label-muted-padding = 1;
          label-volume-foreground = "#79695a";
          format-volume-foreground = "#5d6051";
          format-volume-padding = 1;
        };
      };
    };
    playerctld = {
      enable = true;
      package = pkgs.playerctl;
    };
  };

}
