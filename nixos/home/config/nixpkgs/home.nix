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

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

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
      xorg.xwininfo
      # Terminals, IDEs and Editors
      vscode
      neovim-nightly
      tree-sitter
      jetbrains.idea-community
      # Terminal apps and utils
      manix
      unp
      nixfmt
      unzip
      fd
      rnix-lsp
      xclip
      tokei
      starship
      imagemagick
      libnotify
      scrot
      maim
      slop
      xdotool
      ffmpeg
      hsetroot
      ranger
      lorri
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
