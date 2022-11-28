{ config, lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/peripherals/trackball" = {
      scroll-wheel-emulation-button = 8;
    };
    "org/gnome/desktop/interface" = {
      cursor-theme = "Sakuya-cursors";
      icon-theme = "Qogir-dark";
      #      gtk-theme = "Flat-Remix-GTK-Grey-Light-Solid";
      font-name = "Liberation Sans 12";
      document-font-name = "GohuFont Nerd Font Mono 12";
      monospace-font-name = "GohuFont Nerd Font Mono 12";
    };
    "org/gnome/system/locale" = { region = "pt_BR.UTF-8"; };
    "org/gnome/shell" = {
      enabled-extensions = [
        "gnomebedtime@ionutbortis.gmail.com"
        "espresso@coadmunkee.github.com"
        "gsconnect@andyholmes.github.io"
        #        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "Resource_Monitor@Ory0n"
        "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "dock-from-dash@fthx"
        "no_activities@yaya.cout"
        "no-overview@fthx"
        "places-menu@gnome-shell-extensions.gcampax.github.com"
      ];
    };
    "org/gnome/shell/extension/user-theme" = {
      name = "WhiteSur-Dark-solid";
    };
    "org/gnome/shell/extension/bedtime-mode" = {
      bedtime-mode-active = true;
      color-tone-factor = 80;
    };
    "org/gnome/shell/extensions/blur-my-shell" = {
      color-and-noise = true;
      hacks-level = 0;
    };
    "org/gnome/shell/extension/espresso" = {
      has-battery = false;
      show-notifications = false;
      user-enabled = true;
    };
    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [ "" ];
      switch-to-application-2 = [ "" ];
      switch-to-application-3 = [ "" ];
      switch-to-application-4 = [ "" ];
    };
    "org/gnome/desktop/wm/keybindings" = {
      move-to-workspace-1 = [ "<Shift><Super>1" ];
      move-to-workspace-2 = [ "<Shift><Super>2" ];
      move-to-workspace-3 = [ "<Shift><Super>3" ];
      move-to-workspace-4 = [ "<Shift><Super>4" ];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      mic-mute = [ "<Shift><Super>BackSpace" ];
      volume-down = [ "<Super>minus" ];
      volume-mute = [ "<Super>BackSpace" ];
      volume-up = [ "<Super>equal" ];
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = true;
    };
    "org/gnome/desktop/wm/preferences" = { num-workspaces = 4; };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "us+alt-intl" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "caps:swapescape" ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" =
      {
        binding = "<Shift><Super>minus";
        command = "ddcutil setvcp 10 - 20";
        name = "backlightdown";
      };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" =
      {
        binding = "<Shift><Super>equal";
        command = "ddcutil setvcp 10 + 20";
        name = "backlightup";
      };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" =
      {
        binding = "<Super>Return";
        command = "alacritty";
        name = "terminal";
      };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      #picture-uri = "file:///home/lucio/.background-image";
      #picture-uri-dark = "file:///home/lucio/.background-image";
      picture-uri = "file:///nix/store/35ar90nmzs3n8zqs1sfqlx6z8mk77qqm-simple-blue-2016-02-19/share/backgrounds/nixos/nix-wallpaper-simple-blue.png";
      picture-uri-dark = "file:///nix/store/sn0a9jq9ykq55805v6sdkjm4gsaki9q9-simple-dark-gray-2016-02-19/share/backgrounds/nixos/nix-wallpaper-simple-dark-gray.png";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };
  }; # dconf end
}

