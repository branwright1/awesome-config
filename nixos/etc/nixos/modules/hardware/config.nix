{ config, pkgs, ... }:

{

  nixpkgs = {
    config = {
      packageOverrides = pkgs: {
        vaapiIntel = pkgs.vaapiIntel.override {
          enableHybridCodec = true;
        };
      };
    };
  };

  hardware = {
    cpu = {
      intel = {
        updateMicrocode = true;
      };
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
    pulseaudio = {
      enable = false;
    };
    bluetooth = {
      enable = false;
      package = pkgs.bluezFull;
    };
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
  };

}
