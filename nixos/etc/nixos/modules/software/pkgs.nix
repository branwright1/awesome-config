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
      qemu
      cachix
      nodejs
      gnumake
      redshift
      alacritty
      gdk_pixbuf
      gtk_engines
      virt-manager
      polkit_gnome
      google-chrome
      gtk-engine-murrine
      gobject-introspection
      xdg-desktop-portal-wlr
      gsettings-desktop-schemas
    ];
    pathsToLink = [ "/libexec" ];
  };

}