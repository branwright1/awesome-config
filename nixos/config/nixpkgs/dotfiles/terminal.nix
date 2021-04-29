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
          padding.x = 15;
          padding.y = 15;
          decorations = "none";
        };
        dynamic_padding = true;
        dynamic_title = false;
        scrolling = {
          history = 10000;
        };
        font = {
          size = 13.0;
          normal.family = "Dina";
          bold.family = "Dina";
          italic.family = "Dina";
        };
        cursor.style = "Underline";
        colors = {
          primary = {
            background = "#201e1a";
            foreground = "#79695a";
          };
          normal = {
            black = "#201e1a";
            red = "#674441";
            green = "#5d6051";
            yellow = "#84694e";
            blue = "#545e5e";
            magenta = "#614c4c";
            cyan = "#4d5c5c";
            white = "#867564";
          };
          bright = {
            black = "#574e4a";
            red = "#765754";
            green = "#6d7062";
            yellow = "#907860";
            blue = "#656e6e";
            magenta = "#715e5e";
            cyan = "#5f6c6c";
            white = "#928374";
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
