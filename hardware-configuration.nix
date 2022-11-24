# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "ahci"
    "ohci_pci"
    "ehci_pci"
    "pata_atiixp"
    "xhci_pci"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5f78a007-da6b-4110-9bfc-226340acb8a1";
    fsType = "xfs";
    options = [ "logbsize=256k" ];
  };
  boot.initrd.luks.devices = {
    nix_root = {
      device = "/dev/disk/by-uuid/c10b9174-531e-43e3-abfe-05a4f0397e2e";
      preLVM = false;
      allowDiscards = true;
    };
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/7BD7-B0DE";
    fsType = "vfat";
  };
  swapDevices = [{
    device = "/dev/disk/by-partuuid/5f92a962-fe03-4dbd-8276-99b76bdadb36";
    options = [ "defaults" "nofail" ];
    discardPolicy = "once";
    randomEncryption = {
      enable = true;
      allowDiscards = true;
    };
  }];
  fileSystems."/mnt/data " = {
    device = "/dev/disk/by-uuid/f1451973-4324-4d88-bb57-4a712f7beaf0 ";
    options = [ "nosuid" "noatime" "nofail" "noexec" "group" "nodev" "x-gvfs-show" "noauto" ];
  };
  fileSystems."/mnt/vms " = {
    device = "/dev/disk/by-uuid/c02683d5-67c0-4225-9480-59101c9c6369 ";
    options = [ "nosuid" "noatime" "nofail" "noexec" "group" "nodev" "x-gvfs-show" ];
  };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
}


