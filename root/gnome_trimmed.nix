# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

with lib;

{
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      displayManager = {
        gdm.enable = true;
        autoLogin.enable = true;
        autoLogin.user = "lucio";
        sessionPackages = [ pkgs.gnome.gnome-session.sessions ];
      };
    };
    gnome = {
      gnome-keyring.enable = false;
    };
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-gnome ];
  };
  programs.dconf.enable = true;
  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  environment.systemPackages = with pkgs.gnome; [
    gnome-shell
    gnome-shell-extensions
    gnome-tweaks
  ];
}
