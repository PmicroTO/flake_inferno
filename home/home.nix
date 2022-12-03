{ config, pkgs, lib, ... }:

let
  packageGroups = import ./package-groups.nix { inherit pkgs; };
in

{
  programs.home-manager.enable = true;

  home = {
    username = "lucio";
    homeDirectory = "/home/lucio";
    stateVersion = "23.05";
    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
      #      GTK_THEME = "WhiteSur-Dark-solid";
      # NIXOS_OZONE_WL = "1";
    };
  };
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (pkg: true);
  fonts.fontconfig.enable = true;
  home.packages = with packageGroups; base ++ connect ++ gnomebase;
  # end.packages
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
    to = "tomb open $HOME/personal.tomb -k $HOME/personal.tomb.key ; sleep 600 ; tomb slam all";
    slam = "tomb slam all";
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
          "https://w.wallhaven.cc/full/39/wallhaven-39m7r6.jpg";
        sha256 =
          "0ndadcyqhwjv54m1qb7jlk7jg61p0fck8z4w37z4rbl0zklb5s4l";
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


