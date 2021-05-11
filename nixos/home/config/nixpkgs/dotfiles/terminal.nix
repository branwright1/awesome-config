{ config, pkgs, ... }:

{

  programs = {
    alacritty = {
      enable = true;
      package = pkgs.alacritty;
      settings = {
        env = {
          "TERM" = "xterm-256color";
        };
        window = {
          padding = {
            x = 15;
            y = 15;
          };
          decorations = "full";
        };
        dynamic_padding = true;
        dynamic_title = false;
        scrolling = {
          history = 10000;
        };
        font = {
          size = 12.6;
          normal.family = "scientifica";
          bold.family = "scientifica";
          italic.family = "scientifica";
        };
        cursor.style = "Underline";
        colors = {
          primary = {
            background = "#1D2021"; #1D2021
            foreground = "#BFAB89";
          };
          normal = {
            black   = "#1A1D1E";
            red     = "#D35E58";
            green   = "#98A45B";
            yellow  = "#C2954E";
            blue    = "#709D93";
            magenta = "#BE798B";
            cyan    = "#7BA275";
            white   = "#BFAB89";
          };
          bright = {
            black   = "#928374";
            red     = "#D35E58";
            green   = "#98A45B";
            yellow  = "#C2954E";
            blue    = "#709D93";
            magenta = "#BE798B";
            cyan    = "#7BA275";
            white   = "#BFAB89";
          };
        };
      };
    };
    git = {
      enable = true;
      package = pkgs.git;
      userName = "xxx";
      userEmail = "xxx";
    };
    feh = {
      enable = true;
    };
    fzf = {
      enable = true;
      package = pkgs.fzf;
    };
    exa = {
      enable = true;
      enableAliases = true;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableNixDirenvIntegration = true;
    };
  };

}
