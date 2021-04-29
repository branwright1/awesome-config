{ config, pkgs, ... }:

{

  programs = {
    kakoune = {
      enable = true;
      config = {
        ui = {
          assistant = "cat";
          changeColors = true;
          setTitle = false;
          statusLine = "bottom";
        };
        alignWithTabs = true;
        autoComplete = [ "insert" "prompt" ];
        autoInfo = [ "command" "onkey" ];
        autoReload = "yes";
        numberLines = {
          enable = true;
          relative = true;
          highlightCursor = true;
        };
        showWhitespace = {
          enable = true;
        };
        colorScheme = "gruvbox";
      };
      plugins = with pkgs.kakounePlugins; [
        kak-ansi
        kak-auto-pairs
        kak-buffers
        kak-fzf
        kak-lsp
        kak-powerline
        kak-prelude
        kak-vertical-selection
        kakboard
        kakoune-buffer-switcher
        kakoune-easymotion
        kakoune-extra-filetypes
        kakoune-registers
        tabs-kak
      ];
    };
  };

}
