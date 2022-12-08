{ config, pkgs, lib, ... }: {


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
      set -s copy-command 'wl-copy'
      set -g @plugin 'whame/tmux-modal'
      set -g @modal-yesno-cmd on
      set -g @modal-keybindings-conf ''${HOME}/.config/tmux/tmux_modal.conf
      set -g @plugin 'tmux-plugins/tmux-resurrect'
      set -g @plugin 'tmux-plugins/tmux-continuum'
      set -g @continuum-boot 'on'
      set -g @plugin 'tmux-plugins/tpm' 
      run '~/.tmux/plugins/tpm/tpm' 
      source ${pkgs.powerline}/share/tmux/powerline.conf

    '';
  };
  home.file.".config/tmux/tmux_modal.conf".source = ./config/tmux/tmux_modal.conf;
  home.file.".config/tmux/tmux_carbon.conf".source = ./config/tmux/tmux_carbon.conf;

}
