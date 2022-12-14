{ config, pkgs, lib, ... }:

let packageGroups = import ./package-groups.nix { inherit pkgs; };

in {
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
      MOZ_ENABLE_WAYLAND = 1;
    };
  };
  home.packages = with packageGroups; base ++ connect ++ gnomebase;
  systemd.user.tmpfiles.rules = [

    "D /tmp/lucio-cache 0700 lucio wheel 1w"
    "L+ /home/lucio/.cache - - - - /tmp/lucio-cache"

    "D /tmp/lucio-down 0700 lucio wheel 1w"
    "L+ /home/lucio/user-dirs/down - - - - /tmp/lucio-down"

    "D /tmp/lucio-scsh 0700 lucio wheel 1w"
    "L+ /home/lucio/user-dirs/pics/Screenshots - - - - /tmp/lucio-scsh"

  ];

  programs.alacritty = {
    enable = true;
    settings = {
      import = [ ./alacritty_theme.yml ];
      window = {
        decorations = "none";
        padding = {
          x = 5;
          y = 5;
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

  programs.git = {
    enable = true;
    userEmail = "lucio_a.khfzo@aleeas.com";
    userName = "wnxkiv85";
  };

  xdg.userDirs = {

    enable = true;
    createDirectories = true;
    desktop = "${config.home.homeDirectory}/user-dirs/desk";
    documents = "${config.home.homeDirectory}/user-dirs/docs";
    download = "${config.home.homeDirectory}/user-dirs/down";
    music = "${config.home.homeDirectory}/user-dirs/mus";
    pictures = "${config.home.homeDirectory}/user-dirs/pics";
    publicShare = "${config.home.homeDirectory}/user-dirs/public";
    templates = "${config.home.homeDirectory}/user-dirs/templates";
    videos = "${config.home.homeDirectory}/user-dirs/vid";
    extraConfig = {
      XDG_GIT_DIR = "${config.home.homeDirectory}/user-dirs/git";
      XDG_MISC_DIR = "${config.home.homeDirectory}/user-dirs/misc";
      XDG_STUDY_DIR = "${config.home.homeDirectory}/user-dirs/study";
    };
  };

  systemd.user.startServices = "sd-switch";
  systemd.user.services = {
    fake-cam = {
      Unit = {
        Description = "Fake Webcam";
        Documentation = [ "man:ffmpeg(1)" ];
      };
      Service = {
        Type = "simple";
        ExecStart = "${
            lib.getBin pkgs.ffmpeg_5-full
          }/bin/ffmpeg -stream_loop -1 -re -i %h/.fkcam.webm -vcodec rawvideo -threads 0 -f v4l2 /dev/video0";
      };
      Install = { WantedBy = [ "default.target" ]; };
    };
  };

}
