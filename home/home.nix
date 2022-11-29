{ config, pkgs, lib, ... }: {
  programs.home-manager.enable = true;
  home = {
    username = "lucio";
    homeDirectory = "/home/lucio";
    stateVersion = "22.11";
    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
      #      GTK_THEME = "WhiteSur-Dark-solid";
      # NIXOS_OZONE_WL = "1";
    };
  };
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (pkg: true);
  home.packages = (with pkgs; [
    brave
    libreoffice
    rnix-lsp
    discord
    mumble
    teams
    android-tools
    qogir-icon-theme
    tomb
    ffmpeg_5-full
    (gimp-with-plugins.override { plugins = with gimpPlugins; [ bimp ]; })
    wgetpaste
    kotatogram-desktop
    mailspring
    any-nix-shell
    gcc
    cargo
    wl-clipboard
    fontpreview
    nerdfonts
    steam-run
    #    brave
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
    spice-up
    openshot-qt
    flowblade
    poppler_utils
    detox
    hakuneko
    adw-gtk3
    droidcam
    gnome.pomodoro
    zoxide
  ]) ++ (with pkgs.gnomeExtensions; [
    no-activities-button
    no-overview
    blur-my-shell
    dock-from-dash
    resource-monitor
    gsconnect
    gnome-bedtime
    espresso
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
          family = "GohuFont Nerd Font Mono";
          #          style = "Regular";
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

    }];
    shellInit = ''

                  fish_add_path -p $HOME/.config/nvim/bin
      			set -U fish_greeting
      			'';
    interactiveShellInit =
      "\n                        any-nix-shell fish --info-right | source\n                        zoxide init fish | source \n                        ";
    functions = { };

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
    wp = "wgetpaste";
    ".." = "cd ..";
    #	webmloo = "for i in *.webm; do ffmpeg -stream_loop -1 -t 5 -i \"$i\" -c copy \"\${i%.*}_5.webm\"; done";
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
  };
}


