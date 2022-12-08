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
        "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        "pomodoro@arun.codito.in"
        "no_activities@yaya.cout"
        "no-overview@fthx"
        "task-widget@juozasmiskinis.gitlab.io"
        "places-menu@gnome-shell-extensions.gcampax.github.com"
        "another-window-session-manager@gmail.com"
      ];
    };


    "org/gnome/shell/extension/bedtime-mode" = {
      bedtime-mode-active = true;
      color-tone-factor = 80;
    };

    "org/gnome/shell/extension/another-window-session-manager" = {
      close-windows-rules = ''
        {}
      '';
      enable-autorestore-sessions = true;
      restore-at-startup-without-asking = true;
      restore-session-interval = 16;
    };

    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [ "" ];
      switch-to-application-2 = [ "" ];
      switch-to-application-3 = [ "" ];
      switch-to-application-4 = [ "" ];
      switch-to-application-5 = [ "" ];
      switch-to-application-6 = [ "" ];
      switch-to-application-7 = [ "" ];
      switch-to-application-8 = [ "" ];
      switch-to-application-9 = [ "" ];
    };
    "org/gnome/desktop/wm/keybindings" = {
      begin-move = [ ];
      begin-resize = [ ];
      close = [ "<Super>q" ];
      cycle-group = [ ];
      cycle-group-backward = [ ];
      cycle-panels = [ ];
      cycle-panels-backward = [ ];
      cycle-windows = [ ];
      cycle-windows-backward = [ ];
      lower = [ ];
      maximize = [ ];
      maximize-horizontally = [ ];
      minimize = [ ];
      move-to-monitor-down = [ ];
      move-to-monitor-left = [ ];
      move-to-monitor-right = [ ];
      move-to-monitor-up = [ ];
      move-to-workspace-1 = [ "<Alt><Super>1" ];
      move-to-workspace-2 = [ "<Alt><Super>2" ];
      move-to-workspace-3 = [ "<Alt><Super>3" ];
      move-to-workspace-4 = [ "<Alt><Super>4" ];
      move-to-workspace-last = [ ];
      move-to-workspace-left = [ ];
      move-to-workspace-right = [ ];
      panel-run-dialog = [ "<Super>r" ];
      show-desktop = [ ];
      switch-applications = [ ];
      switch-applications-backward = [ ];
      switch-group = [ ];
      switch-group-backward = [ ];
      switch-input-source = [ "<Super>space" ];
      switch-input-source-backward = [ "<Shift><Super>space" ];
      switch-panels = [ ];
      switch-panels-backward = [ ];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-last = [ ];
      switch-to-workspace-left = [ ];
      switch-to-workspace-right = [ ];
      switch-windows = [ "<Super>Tab" ];
      switch-windows-backward = [ "<Shift><Super>Tab" ];
      toggle-maximized = [ "<Super>0" ];
      unmaximize = [ ];
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
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "us+intl" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "caps:escape" "altwin:swap_lalt_lwin" "lv3:ralt_alt" "grp:shifts_toggle" "grp_led:caps" "lv3:menu_switch" ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" =
      {
        binding = "<Alt><Super>minus";
        command = "ddcutil setvcp 10 - 20";
        name = "backlightdown";
      };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" =
      {
        binding = "<Alt><Super>equal";
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
      picture-uri = "file:///home/lucio/.background-image";
      picture-uri-dark = "file:///home/lucio/.background-image";
      #picture-uri = "file:///nix/store/35ar90nmzs3n8zqs1sfqlx6z8mk77qqm-simple-blue-2016-02-19/share/backgrounds/nixos/nix-wallpaper-simple-blue.png";
      #picture-uri-dark = "file:///nix/store/sn0a9jq9ykq55805v6sdkjm4gsaki9q9-simple-dark-gray-2016-02-19/share/backgrounds/nixos/nix-wallpaper-simple-dark-gray.png";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };
  }; # dconf end
}

