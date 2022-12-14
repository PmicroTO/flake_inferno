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
    extraModprobeConfig =
      " options v4l2loopback card_label=\"Webcam\" exclusive_caps=1 ";
    kernelParams = [
      "amd_iommu=off"
      "iommu=soft"
      "quiet"
      "loglevel=3"
      "video=HDMI-A-1:2560x1080@75"
    ];
    consoleLogLevel = 0;
    loader.timeout = 1;
    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = (with config.boot.kernelPackages; [ rtl88x2bu ]);
  };
  environment.systemPackages =
    (with config.boot.kernelPackages; [ kernel rtl88x2bu ])
    ++ (with pkgs; [ ddcutil ]);
  hardware.i2c.enable = true;
}

