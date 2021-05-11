{ config, pkgs, ... }:

{

  gtk = {
    enable = true;
    theme = let
      phocus = pkgs.stdenv.mkDerivation {
        name = "elkowars_phocus";
        src = builtins.fetchTarball
          "https://github.com/branwright1/gtk/archive/master.tar.gz";
        nativeBuildInputs = [ pkgs.sass ];
        installFlags = [ "DESTDIR=$(out)" "PREFIX=" ];
      };
    in {
      package = phocus;
      name = "elkowars_phocus";
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    font = { name = "scientifica 12"; };
  };

}
