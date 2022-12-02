{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    xkbOptions = "caps:swapescape";
    libinput = {
      enable = true;
      mouse = {
        scrollMethod = "button";
        scrollButton = 8;
        middleEmulation = true;
      };
    };
    exportConfiguration = true;
  };
}
