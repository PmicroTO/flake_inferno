{ config, pkgs, lib, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    keyMode = "vi";
    newSession = true;
    prefix = "C-a";
    extraConfig = ''
      set -ga terminal-overrides ",alacritty:Tc"
      set -g default-command "''${SHELL}"
      set -g allow-passthrough 1 
    '';
  };
}
