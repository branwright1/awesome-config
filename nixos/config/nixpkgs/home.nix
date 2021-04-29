{ config, pkgs, lib, ... }:

{

  imports = [
    ./dotfiles/dunst.nix
    ./dotfiles/gtk.nix
    ./dotfiles/kakoune.nix
    ./dotfiles/mako.nix
    ./dotfiles/mpv.nix
    ./dotfiles/polybar.nix
    ./dotfiles/rofi.nix
    ./dotfiles/sxhkd.nix
    ./dotfiles/terminal.nix
    ./dotfiles/zathura.nix
  ];

  programs = {
    home-manager = {
      enable = true;
      };
    };

  home = {
    username = "bran";
    homeDirectory = "/home/bran";
    packages = with pkgs; [
      # System utils
      oguri
      picom
      flashfocus
      pavucontrol
      scrcpy
      nix-direnv
      font-manager
      gnome3.nautilus
      # Terminals, IDEs and Editors
      starship
      vscode
      tree-sitter
      # Terminal apps and utils
      manix
      unp
      nixfmt
      unzip
      fd
      rnix-lsp
      xclip
      tokei
      imagemagick
      libnotify
      scrot
      maim
      slop
      xdotool
      ffmpeg
      hsetroot
      ranger
      # Web & music
      spotify
      discord
      discocss
      youtube-dl
      qutebrowser
      # Games
      minecraft
      multimc
    ];
    stateVersion = "21.05";
  };

}
