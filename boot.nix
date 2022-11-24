{ config, pkgs, ... }:

{
  boot = {
    loader.systemd-boot = {
      enable = true;
      consoleMode = "max";
      memtest86.enable = true;
    };
    resumeDevice = "";
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = (with config.boot.kernelPackages; [ rtl88x2bu ])
      ++ (with pkgs; [ ecryptfs ]);
  };

  networking.interfaces.wlp0s18f2u2.wakeOnLan.enable = true;

  environment.systemPackages =
    (with config.boot.kernelPackages; [ kernel rtl88x2bu ])
    ++ (with pkgs; [ ddcutil ]);
  boot = {
    kernelParams =
      [ "amd_iommu=off" "iommu=soft" "resume=UUID=e58a561c-60a8-4fa4-92e6-f3dba68c3360" ];
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
