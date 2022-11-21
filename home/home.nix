{ config, pkgs, lib, ... }: {
  programs.home-manager.enable = true;
  home = {
    username = "lucio";
    homeDirectory = "/home/lucio";
    stateVersion = "22.11";
    sessionVariables = {
      EDITOR = "vi";
      VISUAL = "vi";
    };
  };
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (pkg: true);
  home.packages = (with pkgs; [
  wgetpaste
    nautilus-open-any-terminal
    luaformatter
    any-nix-shell
    nixfmt
    gcc
    cargo
    wl-clipboard
    fontpreview
    nerdfonts
    steam-run
    gnome.geary
    brave
    calibre
    transmission-gtk
    pika-backup
    vlc
    authenticator
    nordzy-icon-theme
    disfetch
    ventoy-bin-full
    taskwarrior
    dconf2nix
    arcanPackages.espeak
    detox
    hakuneko
    adw-gtk3
    ecryptfs
    ecryptfs-helper
    droidcam
    webcamoid
    gnome.pomodoro
    zoxide
  ]) ++ (with pkgs.gnomeExtensions; [
    gsconnect
    gnome-bedtime
    espresso
    material-shell
  ]); # end.packages

  programs.alacritty = {
    enable = true;
    settings = {
      import = [ ./alacritty_theme.yml ];
      window = {
        decorations = "none";
        padding = {
          x = 3;
          y = 3;
        };
        dynamic_padding = true;
      };
      font = {
        normal = {
          family = "TerminessTTF Nerd Font Mono";
          style = "Regular";
        };
      };
    };

  };
  programs.fish = {
    enable = true;
    plugins = [{
      name = "hydro";
      src = pkgs.fetchFromGitHub {
        owner = "jorgebucaran";
        repo = "hydro";
        rev = "d4c107a2c99d1066950a09f605bffea61fc0efab";
        sha256 = "1ajh6klw1rkn2mqk4rdghflxlk6ykc3wxgwp2pzfnjd58ba161ki";
      };

    }

      ];
    shellInit = ''

                  fish_add_path -p $HOME/.config/nvim/bin
      			set -U fish_greeting
      			'';
    interactiveShellInit =
      "\n                        any-nix-shell fish --info-right | source\n                        zoxide init fish | source \n                        ";
      functions = {
      };

  };
  home.shellAliases = {
    taskpurge = "task $(task uuids due.before:now) purge";
    opvault = "ecryptfs-mount-private ; sleep 300 ; ecryptfs-umount-private";
    ls = "ls -A --color=auto -cltp --si --group-directories-first";
    flkhr =
      "home-manager switch --max-jobs 8 --flake /home/lucio/Projects/flake_inferno#lucio";
    flkup =
      "sudo nixos-rebuild switch -j 8 --verbose --upgrade --flake /home/lucio/Projects/flake_inferno#inferno --recreate-lock-file";
    flkre =
      "sudo nixos-rebuild switch -j 8 --verbose --flake /home/lucio/Projects/flake_inferno#inferno";
    listports = "sudo netstat -tulpn | grep LISTEN ";
wp= "wgetpaste";
  };
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
                                      set -g @plugin 'arcticicestudio/nord-tmux'
                                      set -g @plugin 'whame/tmux-modal'
                                      set -g @modal-yesno-cmd on
                                      set -g @modal-keybindings-conf ''${HOME}/.config/tmux_modal.conf
                                      set -g @plugin 'tmux-plugins/tmux-resurrect'
                                      set -g @plugin 'tmux-plugins/tmux-continuum'
                                      set -g @continuum-boot 'on'
      				set -g @plugin 'tmux-plugins/tpm' 
                                      run '~/.tmux/plugins/tpm/tpm' 

      			'';

  };
  programs.git = {
    enable = true;
    userEmail = "8f2w79@getgoogleoff.me";
    userName = "wnxkiv85";
  };
  home.file = {
    ".face" = {
      source = pkgs.fetchurl {
        url = "https://nitter.net/pic/media%2FFN_lMoOVUAAnVUd.jpg";
        sha256 =
          "a476548d48768690f44fd8c67f0a566224112bc1003a3a9fa6b3edc18d8bc14e";
      };
    };
    ".background-image" = {
      source = pkgs.fetchurl {
        url =
          "https://raw.githubusercontent.com/wnxkiv85/flake_inferno/main/wallpaper.jpeg";
        sha256 =
          "c11872838c13eaab4a128541a9413526b629e6ed7027b9ac67bb4a5fe0c30284";
      };
    };
    "Sakuya-cursors" = {
      source = pkgs.fetchzip {
        url = "https://0x0.st/o4wb.zip";
        sha512 =
          "1l4l9i0v1n4c4p9047wywhcwr4kdir1lrl34pi1fjbswgvsjyzwmjrxqy1zjihz3prpck040mdxaimqcmhzn9icz93221ids6rvvk33";
      };
      target = ".local/share/icons/Sakuya-cursors";
    };

    "base16-shell-master" = {
      source = pkgs.fetchzip {
        url =
          "https://github.com/chriskempson/base16-shell/archive/refs/heads/master.zip";
        sha512 =
          "0c0lm47wwcqd2lc0293awr8kvpib8pcq1kgnilnbg0d2g0b65if0aj0yrmv1sg3z78c15ssksv9j7ikbhhwifdg3360ypk2plrfyrny";
      };
      target = ".config/base16-shell";
    };
    "tpm" = {
      source = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tpm";
        rev = "b699a7e01c253ffb7818b02d62bce24190ec1019";
        sha256 = "1395fv70gxkpqswnraw50fcaawnjn91j4a44yzz1c3vmm3jp4r38";
      };
      target = ".tmux/plugins/tpm";
    };
    "tmux_modal.conf" = {
      text =
        "\nKBD_CMD=C-space\nKBD_CMD_EXIT=C-space\nKBD_QUIT=q\nKBD_COPY_MODE=c\nKBD_PASTE=y\nKBD_CMD_PROMPT=:\nKBD_WIN=w\nKBD_WIN_GOTO_0=0\nKBD_WIN_GOTO_1=1\nKBD_WIN_GOTO_2=2\nKBD_WIN_GOTO_3=3\nKBD_WIN_GOTO_4=4\nKBD_WIN_GOTO_5=5\nKBD_WIN_GOTO_6=6\nKBD_WIN_GOTO_7=7\nKBD_WIN_GOTO_8=8\nKBD_WIN_GOTO_9=9\nKBD_WIN_GOTO_TREE=t\nKBD_WIN_GOTO_INDEX=i\nKBD_WIN_PANE_LEFT=h\nKBD_WIN_PANE_RIGHT=l\nKBD_WIN_PANE_UP=k\nKBD_WIN_PANE_DOWN=j\nKBD_WIN_PANE_DEL=d\nKBD_WIN_PREV=H\nKBD_WIN_NEXT=L\nKBD_WIN_DEL=D\nKBD_WIN_CREATE=c\nKBD_WIN_LAST=o\nKBD_WIN_ZOOM=z\nKBD_WIN_BREAK=b\nKBD_WIN_NR=n\nKBD_WIN_RENAME=,\nKBD_WIN_PANE=w\nKBD_WIN_SPLIT=s\nKBD_WIN_SPLIT_RIGHT=l\nKBD_WIN_SPLIT_DOWN=j\nKBD_WIN_MOVE=m\nKBD_WIN_MOVE_UP=k\nKBD_WIN_MOVE_DOWN=j\nKBD_WIN_ARRANGE=a\nKBD_WIN_ARRANGE_1=1\nKBD_WIN_ARRANGE_2=2\nKBD_WIN_ARRANGE_3=3\nKBD_WIN_ARRANGE_4=4\nKBD_WIN_RESIZE=r\nKBD_WIN_RESIZE_LEFT=h\nKBD_WIN_RESIZE_RIGHT=l\nKBD_WIN_RESIZE_DOWN=j\nKBD_WIN_RESIZE_UP=k\nKBD_WIN_RESIZE_MULTI_LEFT=H\nKBD_WIN_RESIZE_MULTI_RIGHT=L\nKBD_WIN_RESIZE_MULTI_DOWN=J\nKBD_WIN_RESIZE_MULTI_UP=K\nKBD_SESS=s\nKBD_SESS_DETACH=d\nKBD_SESS_PREV=h\nKBD_SESS_NEXT=l\nKBD_SESS_TREE=t\nKBD_SESS_DEL=D\nKBD_GOTO=g\nKBD_GOTO_WIN=w\nKBD_GOTO_WIN_0=0\nKBD_GOTO_WIN_1=1\nKBD_GOTO_WIN_2=2\nKBD_GOTO_WIN_3=3\nKBD_GOTO_WIN_4=4\nKBD_GOTO_WIN_5=5\nKBD_GOTO_WIN_6=6\nKBD_GOTO_WIN_7=7\nKBD_GOTO_WIN_8=8\nKBD_GOTO_WIN_9=9\nKBD_GOTO_WIN_TREE=t\nKBD_GOTO_WIN_INDEX=i\nKBD_GOTO_WIN_PREV=h\nKBD_GOTO_WIN_NEXT=l\nKBD_GOTO_WIN_LAST=o\nKBD_GOTO_SESS=s\nKBD_GOTO_SESS_PREV=h\nKBD_GOTO_SESS_NEXT=l\nKBD_GOTO_SESS_TREE=tKBD_WIN_PANE_LEFT=h\nKBD_WIN_PANE_RIGHT=l\nKBD_WIN_PANE_UP=k\nKBD_WIN_PANE_DOWN=j\nKBD_WIN_PANE_DEL=d\nKBD_WIN_PREV=H\nKBD_WIN_NEXT=L\nKBD_WIN_DEL=D\nKBD_WIN_CREATE=c\nKBD_WIN_LAST=o\nKBD_WIN_ZOOM=z\nKBD_WIN_BREAK=b\nKBD_WIN_NR=n\nKBD_WIN_RENAME=,\nKBD_WIN_PANE=w\nKBD_WIN_SPLIT=s\nKBD_WIN_SPLIT_RIGHT=l\nKBD_WIN_SPLIT_DOWN=j\nKBD_WIN_MOVE=m\nKBD_WIN_MOVE_UP=k\nKBD_WIN_MOVE_DOWN=j\nKBD_WIN_ARRANGE=a\nKBD_WIN_ARRANGE_1=1\nKBD_WIN_ARRANGE_2=2\nKBD_WIN_ARRANGE_3=3\nKBD_WIN_ARRANGE_4=4\nKBD_WIN_RESIZE=r\nKBD_WIN_RESIZE_LEFT=h\nKBD_WIN_RESIZE_RIGHT=l\nKBD_WIN_RESIZE_DOWN=j\nKBD_WIN_RESIZE_UP=k\nKBD_WIN_RESIZE_MULTI_LEFT=H\nKBD_WIN_RESIZE_MULTI_RIGHT=L\nKBD_WIN_RESIZE_MULTI_DOWN=J\nKBD_WIN_RESIZE_MULTI_UP=K\nKBD_SESS=s\nKBD_SESS_DETACH=d\nKBD_SESS_PREV=h\nKBD_SESS_NEXT=l\nKBD_SESS_TREE=t\nKBD_SESS_DEL=D\nKBD_GOTO=g\nKBD_GOTO_WIN=w\nKBD_GOTO_WIN_0=0\nKBD_GOTO_WIN_1=1\nKBD_GOTO_WIN_2=2\nKBD_GOTO_WIN_3=3\nKBD_GOTO_WIN_4=4\nKBD_GOTO_WIN_5=5\nKBD_GOTO_WIN_6=6\nKBD_GOTO_WIN_7=7\nKBD_GOTO_WIN_8=8\nKBD_GOTO_WIN_9=9\nKBD_GOTO_WIN_TREE=t\nKBD_GOTO_WIN_INDEX=i\nKBD_GOTO_WIN_PREV=h\nKBD_GOTO_WIN_NEXT=l\nKBD_GOTO_WIN_LAST=o\nKBD_GOTO_SESS=s\nKBD_GOTO_SESS_PREV=h\nKBD_GOTO_SESS_NEXT=l\nKBD_GOTO_SESS_TREE=t\n                          ";
      target = ".config/tmux_modal.conf";
    };
  };
}
