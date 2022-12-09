{ config, pkgs, lib, ... }:

let
  packageGroups = import ./package-groups.nix { inherit pkgs; };
in

{
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
    userEmail = "8f2w79@getgoogleoff.me";
    userName = "wnxkiv85";
  };
}


