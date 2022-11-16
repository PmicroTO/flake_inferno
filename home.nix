{ config, pkgs, lib, ... }:

{
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
  home.packages = (with pkgs ;[
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
  ]) ++ (with pkgs.gnomeExtensions ;[
    gsconnect
    gnome-bedtime
    espresso
    material-shell
  ]); #end.packages
  programs.alacritty = {
    enable = true;
    settings = {
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
          family = "MesloLGLDZ Nerd Font";
          style = "Regular";
        };
      };
      colors = {
        primary = {
          background = "#2e3440";
          foreground = "#d8dee9";
          dim_foreground = "#a5abb6";
        };
        cursor = {
          text = "#2e3440";
          cursor = "#d8dee9";
        };
        vi_mode_cursor = {
          text = "#2e3440";
          cursor = "#d8dee9";
        };
        selection = {
          text = "CellForeground";
          background = "#4c566a";
        };
        search = {
          matches = {
            foreground = "CellBackground";
            background = "#88c0d0";
          };
          footer_bar = {
            background = "#434c5e";
            foreground = "#d8dee9";
          };
        };
        normal = {
          black = "#3b4252";
          red = "#bf616a";
          green = "#a3be8c";
          yellow = "#ebcb8b";
          blue = "#81a1c1";
          magenta = "#b48ead";
          cyan = "#88c0d0";
          white = "#e5e9f0";
        };
        bright = {
          black = "#4c566a";
          red = "#bf616a";
          green = "#a3be8c";
          yellow = "#ebcb8b";
          blue = "#81a1c1";
          magenta = "#b48ead";
          cyan = "#8fbcbb";
          white = "#eceff4";
        };
        dim = {
          black = "#373e4d";
          red = "#94545d";
          green = "#809575";
          yellow = "#b29e75";
          blue = "#68809a";
          magenta = "#8c738c";
          cyan = "#6d96a5";
          white = "#aeb3bb";
        };
      };
    };

  };
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "hydro";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "hydro";
          rev = "d4c107a2c99d1066950a09f605bffea61fc0efab";
          sha256 = "1ajh6klw1rkn2mqk4rdghflxlk6ykc3wxgwp2pzfnjd58ba161ki";
        };

      }

    ];
    shellInit = "
#                        fish_add_path -p \$HOME/.config/nvim/bin
			#zoxide
			zoxide init fish | source \
			set -U fish_greeting
			";
    interactiveShellInit = "
			";

  };
  home.shellAliases = {
    taskpurge = "task $(task uuids due.before:now) purge";
    opvault = "ecryptfs-mount-private ; sleep 300 ; ecryptfs-umount-private";
    ls = "ls -A --color=auto -cltp --si --group-directories-first";
    flkhr = "home-manager switch --max-jobs 8 --flake /home/lucio/Projects/flake_inferno#lucio";
    flkup = "sudo nixos-rebuild switch -j 8 --verbose --upgrade --flake /home/lucio/Projects/flake_inferno#inferno";
    flkre = "sudo nixos-rebuild switch -j 8 --verbose --flake /home/lucio/Projects/flake_inferno#inferno";
    listports = "sudo netstat -tulpn | grep LISTEN ";
  };
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    keyMode = "vi";
    newSession = true;
    prefix = "C-a";
    extraConfig = "
				set -ga terminal-overrides \",alacritty:Tc\"
				set -g default-command \"\${SHELL}\"
                                set -g allow-passthrough 1 
                                set -s copy-command 'wl-copy'
                                set -g @plugin 'arcticicestudio/nord-tmux'
                                set -g @plugin 'whame/tmux-modal'
                                set -g @modal-yesno-cmd on
                                set -g @modal-keybindings-conf \${HOME}/.config/tmux_modal.conf
                                set -g @plugin 'tmux-plugins/tmux-resurrect'
                                set -g @plugin 'tmux-plugins/tmux-continuum'
                                set -g @continuum-boot 'on'
				set -g @plugin 'tmux-plugins/tpm' 
                                run '~/.tmux/plugins/tpm/tpm' 

			";

  };
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    extraPackages = (with pkgs ;[ tree-sitter nodejs ripgrep fd unzip ]);
    #   plugins = (with pkgs.vimPlugins ;[ nvim-base16 vim-nix telescope-nvim ]);
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
        sha256 = "a476548d48768690f44fd8c67f0a566224112bc1003a3a9fa6b3edc18d8bc14e";
      };
    };
    ".background-image" = {
      source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/wnxkiv85/flake_inferno/main/wallpaper.jpeg";
        sha256 = "c11872838c13eaab4a128541a9413526b629e6ed7027b9ac67bb4a5fe0c30284";
      };
    };
    "Sakuya-cursors" = {
      source = pkgs.fetchzip {
        url = "https://0x0.st/o4wb.zip";
        sha512 = "1l4l9i0v1n4c4p9047wywhcwr4kdir1lrl34pi1fjbswgvsjyzwmjrxqy1zjihz3prpck040mdxaimqcmhzn9icz93221ids6rvvk33";
      };
      target = ".local/share/icons/Sakuya-cursors";
    };

    "base16-shell-master" = {
      source = pkgs.fetchzip {
        url = "https://github.com/chriskempson/base16-shell/archive/refs/heads/master.zip";
        sha512 = "0c0lm47wwcqd2lc0293awr8kvpib8pcq1kgnilnbg0d2g0b65if0aj0yrmv1sg3z78c15ssksv9j7ikbhhwifdg3360ypk2plrfyrny";
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
    "nyoom.nvim" = {
      source = pkgs.fetchFromGitHub {
        owner = "shaunsingh";
        repo = "nyoom.nvim";
        rev = "ec3faaacb52207e99c54a66e04f5425adb772faa";
        sha256 = "0r3xwrjw07f8n35fb3s9w4kkavsciqwsw408bfi7vdfyax5fxc5x";
      };
	target = ".config/nvim";
	text = "blank";
	recursive = true;
    };
    "tmux_modal.conf" = {
      text = "
KBD_CMD=C-space
KBD_CMD_EXIT=C-space
KBD_QUIT=q
KBD_COPY_MODE=c
KBD_PASTE=y
KBD_CMD_PROMPT=:
KBD_WIN=w
KBD_WIN_GOTO_0=0
KBD_WIN_GOTO_1=1
KBD_WIN_GOTO_2=2
KBD_WIN_GOTO_3=3
KBD_WIN_GOTO_4=4
KBD_WIN_GOTO_5=5
KBD_WIN_GOTO_6=6
KBD_WIN_GOTO_7=7
KBD_WIN_GOTO_8=8
KBD_WIN_GOTO_9=9
KBD_WIN_GOTO_TREE=t
KBD_WIN_GOTO_INDEX=i
KBD_WIN_PANE_LEFT=h
KBD_WIN_PANE_RIGHT=l
KBD_WIN_PANE_UP=k
KBD_WIN_PANE_DOWN=j
KBD_WIN_PANE_DEL=d
KBD_WIN_PREV=H
KBD_WIN_NEXT=L
KBD_WIN_DEL=D
KBD_WIN_CREATE=c
KBD_WIN_LAST=o
KBD_WIN_ZOOM=z
KBD_WIN_BREAK=b
KBD_WIN_NR=n
KBD_WIN_RENAME=,
KBD_WIN_PANE=w
KBD_WIN_SPLIT=s
KBD_WIN_SPLIT_RIGHT=l
KBD_WIN_SPLIT_DOWN=j
KBD_WIN_MOVE=m
KBD_WIN_MOVE_UP=k
KBD_WIN_MOVE_DOWN=j
KBD_WIN_ARRANGE=a
KBD_WIN_ARRANGE_1=1
KBD_WIN_ARRANGE_2=2
KBD_WIN_ARRANGE_3=3
KBD_WIN_ARRANGE_4=4
KBD_WIN_RESIZE=r
KBD_WIN_RESIZE_LEFT=h
KBD_WIN_RESIZE_RIGHT=l
KBD_WIN_RESIZE_DOWN=j
KBD_WIN_RESIZE_UP=k
KBD_WIN_RESIZE_MULTI_LEFT=H
KBD_WIN_RESIZE_MULTI_RIGHT=L
KBD_WIN_RESIZE_MULTI_DOWN=J
KBD_WIN_RESIZE_MULTI_UP=K
KBD_SESS=s
KBD_SESS_DETACH=d
KBD_SESS_PREV=h
KBD_SESS_NEXT=l
KBD_SESS_TREE=t
KBD_SESS_DEL=D
KBD_GOTO=g
KBD_GOTO_WIN=w
KBD_GOTO_WIN_0=0
KBD_GOTO_WIN_1=1
KBD_GOTO_WIN_2=2
KBD_GOTO_WIN_3=3
KBD_GOTO_WIN_4=4
KBD_GOTO_WIN_5=5
KBD_GOTO_WIN_6=6
KBD_GOTO_WIN_7=7
KBD_GOTO_WIN_8=8
KBD_GOTO_WIN_9=9
KBD_GOTO_WIN_TREE=t
KBD_GOTO_WIN_INDEX=i
KBD_GOTO_WIN_PREV=h
KBD_GOTO_WIN_NEXT=l
KBD_GOTO_WIN_LAST=o
KBD_GOTO_SESS=s
KBD_GOTO_SESS_PREV=h
KBD_GOTO_SESS_NEXT=l
KBD_GOTO_SESS_TREE=tKBD_WIN_PANE_LEFT=h
KBD_WIN_PANE_RIGHT=l
KBD_WIN_PANE_UP=k
KBD_WIN_PANE_DOWN=j
KBD_WIN_PANE_DEL=d
KBD_WIN_PREV=H
KBD_WIN_NEXT=L
KBD_WIN_DEL=D
KBD_WIN_CREATE=c
KBD_WIN_LAST=o
KBD_WIN_ZOOM=z
KBD_WIN_BREAK=b
KBD_WIN_NR=n
KBD_WIN_RENAME=,
KBD_WIN_PANE=w
KBD_WIN_SPLIT=s
KBD_WIN_SPLIT_RIGHT=l
KBD_WIN_SPLIT_DOWN=j
KBD_WIN_MOVE=m
KBD_WIN_MOVE_UP=k
KBD_WIN_MOVE_DOWN=j
KBD_WIN_ARRANGE=a
KBD_WIN_ARRANGE_1=1
KBD_WIN_ARRANGE_2=2
KBD_WIN_ARRANGE_3=3
KBD_WIN_ARRANGE_4=4
KBD_WIN_RESIZE=r
KBD_WIN_RESIZE_LEFT=h
KBD_WIN_RESIZE_RIGHT=l
KBD_WIN_RESIZE_DOWN=j
KBD_WIN_RESIZE_UP=k
KBD_WIN_RESIZE_MULTI_LEFT=H
KBD_WIN_RESIZE_MULTI_RIGHT=L
KBD_WIN_RESIZE_MULTI_DOWN=J
KBD_WIN_RESIZE_MULTI_UP=K
KBD_SESS=s
KBD_SESS_DETACH=d
KBD_SESS_PREV=h
KBD_SESS_NEXT=l
KBD_SESS_TREE=t
KBD_SESS_DEL=D
KBD_GOTO=g
KBD_GOTO_WIN=w
KBD_GOTO_WIN_0=0
KBD_GOTO_WIN_1=1
KBD_GOTO_WIN_2=2
KBD_GOTO_WIN_3=3
KBD_GOTO_WIN_4=4
KBD_GOTO_WIN_5=5
KBD_GOTO_WIN_6=6
KBD_GOTO_WIN_7=7
KBD_GOTO_WIN_8=8
KBD_GOTO_WIN_9=9
KBD_GOTO_WIN_TREE=t
KBD_GOTO_WIN_INDEX=i
KBD_GOTO_WIN_PREV=h
KBD_GOTO_WIN_NEXT=l
KBD_GOTO_WIN_LAST=o
KBD_GOTO_SESS=s
KBD_GOTO_SESS_PREV=h
KBD_GOTO_SESS_NEXT=l
KBD_GOTO_SESS_TREE=t
                          ";
      target = ".config/tmux_modal.conf";
    };
  };
}
