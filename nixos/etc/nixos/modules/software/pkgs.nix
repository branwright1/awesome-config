{ config, pkgs, ... }:

{

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      git
      gcc
      zig
      lua
      wget
      curl
      cachix
      nodejs
      redshift
      alacritty
      gdk_pixbuf
      gtk_engines
      polkit_gnome
      google-chrome
      microcodeIntel
      gtk-engine-murrine
      gobject-introspection
      xdg-desktop-portal-wlr
      gsettings-desktop-schemas
    ];
    pathsToLink = [ "/libexec" ];
  };

}
