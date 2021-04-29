{ config, pkgs, ... }:

{

  services = {
    dunst = {
      enable = false;
      package = pkgs.dunst;
      settings = {
        global = {
          follow = "mouse";
          sort = "yes";
          geometry = "295x10-810-950";
          indicate_hidden = "yes";
          shrink = "no";
          transparency = 0;
          notification_height = 30;
          separator_height = 1;
          separator_color = "frame";
          padding = 12;
          horiontal_padding = 12;
          frame_width = 2;
          frame_color = "#473428";
          idle_threshold = 120;
          font = "Dina 9";
          line_height = 5;
          markup = "full";
          format = ''
            <b>%s</b>\n%b
          '';
          alignment = "center";
          vertical_alignment = "center";
          show_age_threshold = 60;
          word_wrap = "yes";
          ellipsize = "middle";
          ignore_newline = "no";
          stack_duplicates = "no";
          hide_duplicate_count = false;
          show_indicators = "no";
          icon_position = "left";
          min_icon_size = 55;
          max_icon_size = 55;
          sticky_history = "no";
          history_length = 1;
          corner_radius = 0;
          ignore_dbusclose = false;
          force_xinerama = true;
          mouse_left_click = "close_current";
          mouse_middle_click = "do_action, close_current";
          mouse_right_click = "close_all";
        };
        experimental = {
          close = "ctrl+space";
          close_all = "ctrl+shift+space";
          context = "ctrl+shift+period";
        };
        urgency_low = {
          background = "#201e1a";
          foreground = "#867564";
          timeout = 5;
        };
        urgency_normal = {
          background = "#201e1a";
          foreground = "#867564";
          timeout = 5;
        };
        urgency_criticcal = {
          background = "#201e1a";
          foreground = "#674441";
          frame_color = "#674441";
          timeout = 0;
        };
      };
    };

  };

}
