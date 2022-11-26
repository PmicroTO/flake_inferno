{ config, pkgs, ... }:

{
  boot = {
    loader.systemd-boot = {
      enable = true;
      consoleMode = "max";
      memtest86.enable = true;
    };
    initrd = {
      systemd.enable = true;
      verbose = false;
    };
    kernelParams = [ "amd_iommu=off" "iommu=soft" "quiet" "loglevel=3" ];
    consoleLogLevel = 0;
    loader.timeout = 1;
    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = (with config.boot.kernelPackages; [ rtl88x2bu ]);
  };
  environment.systemPackages =
    (with config.boot.kernelPackages; [ kernel rtl88x2bu ])
    ++ (with pkgs; [ ddcutil ]);
  hardware.i2c.enable = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}

