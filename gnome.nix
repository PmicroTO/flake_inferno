# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      displayManager.autoLogin.enable = true;
      displayManager.autoLogin.user = "lucio";
    };
    gnome = {
      gnome-keyring.enable = lib.mkDefault false;
    };
    power-profiles-daemon.enable = false;
    upower.enable = lib.mkDefault config.powerManagement.disable;
    packagekit.enable = lib.mkDefault false;
  };

  xdg.portal.enable = true;
  programs.dconf.enable = true;
  security.pam.services.lucio.enableGnomeKeyring = true;
  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  #	services.gnome.core-utilities.enable = false;
  environment.gnome.excludePackages =
    (with pkgs; [ gnome-photos gnome-tour rhythmbox gnome-console ])
    ++ (with pkgs.gnome; [
      geary
      cheese
      gnome-music
      gnome-terminal
      epiphany
      gnome-characters
      gnome-font-viewer
      gnome-logs
      totem
      gnome-maps
      yelp
      gnome-software
    ]);
}
