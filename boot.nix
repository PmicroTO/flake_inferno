{ config, pkgs, ... }:

{
  boot = {
    loader.systemd-boot = {
      enable = true;
      consoleMode = "max";
      memtest86.enable = true;
    };
    resumeDevice = "/dev/disk/by-partuuid/5f92a962-fe03-4dbd-8276-99b76bdadb36";
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = (with config.boot.kernelPackages; [ rtl88x2bu ])
      ++ (with pkgs; [ ecryptfs ]);
  };
  environment.systemPackages =
    (with config.boot.kernelPackages; [ kernel rtl88x2bu ])
    ++ (with pkgs; [ ddcutil ]);
  boot = {
    kernelParams =
      [ "amd_iommu=off" "iommu=soft" "quiet" "udev.log_level=3" "loglevel=3" "resume=PARTUUID=5f92a962-fe03-4dbd-8276-99b76bdadb36" ];
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelModules = [ "ecryptfs" ];
    supportedFilesystems = [ "ecryptfs" ];
  };
  hardware.i2c.enable = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
