{ config, pkgs, lib, ... }:

{

  nixpkgs = {
    overlays = let source = builtins.fromJSON (builtins.readFile ./source.json);
    in [
      (self: super: {
        awesome = super.awesome.overrideAttrs (old: {
          src = super.fetchFromGitHub rec {
            name = "source-${owner}-${repo}-${rev}";
            inherit (source) owner repo rev sha256;
          };
        });
      })
    ];
  };

  services = {
    xserver = {
      enable = true;
      layout = "pl";
      dpi = 96;
      xkbOptions = "eurosign:u";
      libinput.enable = true;
      displayManager = {
        lightdm = { enable = true; };
        autoLogin = {
          enable = true;
          user = "bran";
        };
        defaultSession = "xfce+awesome";
      };
      desktopManager = {
        xterm = {
          enable = true;
        };
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
      windowManager = {
        awesome = {
          enable = true;
          luaModules = with pkgs.lua52Packages; [
            lgi
            ldbus
            luarocks-nix
            luadbi-mysql
            luaposix
          ];
        };
        herbstluftwm = {
          enable = true;
          package = pkgs.herbstluftwm;
          configFile =
            "/home/bran/.config/nixpkgs/dotfiles/herbstluftwm/autostart";
        };
      };
    };
  };

}
