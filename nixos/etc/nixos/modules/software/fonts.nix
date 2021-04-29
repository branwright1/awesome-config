{ config, pkgs, ... }:

{

  fonts.fonts = with pkgs; [
    cherry
    cozette
    dina-font
    noto-fonts
    scientifica
    cascadia-code
    weather-icons
    noto-fonts-cjk
    noto-fonts-emoji
    terminus_font_ttf
    material-design-icons
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Terminus" ]; })
  ];

}
