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
        "tiling-assistant@leleat-on-github"
        "just-perfection-desktop@just-perfection"
      ];
    };
    "org/gnome/shell/extension/bedtime-mode" = {
      bedtime-mode-active = true;
      color-tone-factor = 80;
    };
    "org/gnome/shell/extension/espresso" = {
      has-battery = false;
      show-notifications = false;
      user-enabled = true;
    };

    "org/gnome/shell/extension/tiling-assistant" = {
      activate-layout0 = [ ];
      activate-layout1 = [ ];
      activate-layout2 = [ ];
      activate-layout3 = [ ];
      active-window-hint = 1;
      active-window-hint-color = "rgb(53,132,228)";
      auto-tile = [ ];
      center-window = [ "<Super>c" ];
      debugging-free-rects = [ ];
      debugging-show-tiled-rects = [ ];
      default-move-mode = 0;
      dynamic-keybinding-behaviour = 1;
      enable-tiling-popup = true;
      import-layout-examples = false;
      last-version-installed = 39;
      maximize-with-gap = false;
      restore-window = [ "<Alt>c" ];
      search-popup-layout = [ ];
      single-screen-gap = 0;
      tile-bottom-half = [ "<Super>j" ];
      tile-bottom-half-ignore-ta = [ ];
      tile-bottomleft-quarter = [ ];
      tile-bottomleft-quarter-ignore-ta = [ ];
      tile-bottomright-quarter = [ ];
      tile-bottomright-quarter-ignore-ta = [ ];
      tile-edit-mode = [ ];
      tile-left-half = [ "<Super>h" ];
      tile-left-half-ignore-ta = [ ];
      tile-maximize = [ "<Super>0" ];
      tile-maximize-horizontally = [ ];
      tile-maximize-vertically = [ ];
      tile-right-half = [ "<Super>l" ];
      tile-right-half-ignore-ta = [ ];
      tile-top-half = [ "<Super>k" ];
      tile-top-half-ignore-ta = [ ];
      tile-topleft-quarter = [ ];
      tile-topleft-quarter-ignore-ta = [ ];
      tile-topright-quarter = [ ];
      tile-topright-quarter-ignore-ta = [ ];
      toggle-always-on-top = [ ];
      toggle-tiling-popup = [ ];
      window-gap = 0;
    };

    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [ "" ];
      switch-to-application-2 = [ "" ];
      switch-to-application-3 = [ "" ];
      switch-to-application-4 = [ "" ];
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

