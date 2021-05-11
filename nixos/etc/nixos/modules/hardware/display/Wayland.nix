{ config, pkgs, ... }:

{

  programs = {
    sway = {
      enable = true;
      wrapperFeatures = {
        base = true;
        gtk = true;
      };
      extraPackages = with pkgs; [
        mako
        grim
        wofi
        slurp
        waybar
        swaybg
        swayidle
        swaylock
        xwayland
        flashfocus
        wf-recorder
        wl-clipboard
        sway-contrib.grimshot
      ];
      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
        export _JAVA_AWT_WM_NONREPARENTING=1
      '';
    };
  };

}
