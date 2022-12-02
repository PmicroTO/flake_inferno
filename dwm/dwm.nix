{ config, pkgs, lib, ... }:
{
  nixpkgs.overlays = [
    (self: super: {
      dwm = super.dwm.overrideAttrs (oldAttrs: rec {
        patches = [ ];
        configFile = super.writeText "config.h" (builtins.readFile ./dwm_config.h);
        postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config file...'\n cp ${configFile} config.def.h";
      });
    })
  ];
  services.xserver.windowManager.dwm.enable = true;

  environment.systemPackages = with pkgs; [
    j4-dmenu-desktop
    dmenu
    rlaunch
  ];
}
