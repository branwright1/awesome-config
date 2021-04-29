{ config, pkgs, ... }:

{

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_xanmod;
    kernelParams = [ "intel_pstate=active" ];
    kernelModules = [ "kvm-intel" "coretemp" ];
    initrd = {
      kernelModules = [
        "xhci_pci"
        "ehci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
        "sr_mod"
        "rtsx_usb_sdmmc"
      ];
    };
  };

  virtualisation = {
    libvirtd = {
      enable = false;
      qemuOvmf = true;
      qemuPackage = pkgs.qemu;
      onBoot = [ "start" ];
      onShutdown = [ "shutdown" ];
    };
    docker = {
      enable = true;
      package = pkgs.docker;
      enableOnBoot = true;
    };
  };

}
