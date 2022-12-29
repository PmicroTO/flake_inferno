{ config, lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {

    ### EXTENSIONS
    "org/gnome/shell" = {
      enabled-extensions = [
        "gnomebedtime@ionutbortis.gmail.com"
        "espresso@coadmunkee.github.com"
        "dash-to-panel@jderose9.github.com"
        "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        "pomodoro@arun.codito.in"
        "unredirect@vaina.lt" #necessary to temporary fix bedtime mode wayland fullscreen
      ];
    };

    "org/gnome/shell/extensions/bedtime-mode" = {
      bedtime-mode-active = true;
      color-tone-factor = 70;
      ondemand-button-location = "menu";
      ondemand-button-visibility = "always";
    };

    "org/gnome/shell/extensions/espresso" = {
      has-battery = false;
      show-indicator = true;
      show-notifications = false;
    };

    "org/gnome/shell/extensions/dash-to-panel" = {

      animate-appicon-hover-animation-extent = "{'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}";
      appicon-margin = 8;
      appicon-padding = 4;
      available-monitors = [ 0 ];
      dot-style-focused = "DOTS";
      dot-style-unfocused = "DOTS";
      hide-overview-on-startup = true;
      hotkeys-overlay-combo = "TEMPORARILY";
      intellihide-key-toggle = [ "<Super>i" ];
      isolate-workspaces = true;
      leftbox-padding = -1;
      panel-anchors = ''
        {"0":"MIDDLE"}
      '';
      panel-element-positions = ''
        {"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"systemMenu","visible":true,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":false,"position":"centered"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}]}
      '';
      panel-lengths = ''
        {"0":100}
      '';
      panel-positions = ''
        {"0":"BOTTOM"}
      '';
      panel-sizes = ''
        {"0":32}
      '';
      primary-monitor = 0;
      shortcut = [ "<Super>q" ];
      status-icon-padding = -1;
      trans-bg-color = "#000000";
      trans-panel-opacity = 0.0;
      trans-use-custom-bg = true;
      trans-use-custom-opacity = false;
      tray-padding = -1;
      window-preview-title-position = "TOP";

    };

    ### SHELL/WM

    "org/gnome/desktop/wm/preferences" = { num-workspaces = 4; };
    "org/gnome/desktop/interface" = { enable-hot-corners = false; toolkit-acessibility = false; };
    "system/locale" = {
      region = "en_GB.UTF-8";
    };

    ### KEYS

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" ];
      email = [ "<Super>m" ];
      help = [ ];
      magnifier-zoom-in = [ ];
      magnifier-zoom-out = [ ];
      mic-mute = [ "<Alt><Super>BackSpace" ];
      volume-down = [ "<Super>minus" ];
      volume-mute = [ "<Super>BackSpace" ];
      volume-up = [ "<Super>equal" ];
      www = [ "<Super>b" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "alacritty";
      name = "term";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Alt><Super>minus";
      command = "ddcutil setvcp 10 - 20";
      name = "bld";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Alt><Super>equal";
      command = "ddcutil setvcp 10 + 20";
      name = "blu";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "us+intl" ]) ];
      xkb-options = [ "altwin:swap_lalt_lwin" "caps:escape" "lv3:menu_switch" "grp:shifts_toggle" "lvl3:ralt_alt" "lv3:ralt_alt" "grp_led:caps" ];
    };

    "org/gnome/desktop/peripherals/trackball" = {
      scroll-wheel-emulation-button = 8;
    };

    "org/gnome/mutter" = {
      edge-tiling = true;
      workspaces-only-on-primary = false;
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ "<Super>h" ];
      toggle-tiled-right = [ "<Super>l" ];
    };

    "org/gnome/desktop/wm/keybindings" = {

      activate-window-menu = [ ];
      begin-move = [ ];
      begin-resize = [ ];
      close = [ "<Super>q" ];
      cycle-group = [ ];
      cycle-group-backward = [ ];
      cycle-windows = [ ];
      cycle-windows-backward = [ ];
      lower = [ "<Super>j" ];
      maximize = [ ];
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
      raise = [ ];
      raise-or-lower = [ ];
      switch-applications = [ ];
      switch-applications-backward = [ ];
      switch-group = [ ];
      switch-group-backward = [ ];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-left = [ ];
      switch-to-workspace-right = [ ];
      switch-windows = [ "<Super>Tab" ];
      switch-windows-backward = [ "<Shift><Super>Tab" ];
      toggle-fullscreen = [ "<Super>0" ];
      toggle-maximized = [ "<Super>k" ];
      toggle-on-all-workspaces = [ ];
      unmaximize = [ ];

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
      toggle-message-tray = [ ];
    };

    ### LOOKS

    "org/gnome/desktop/interface" = {
      cursor-theme = "Sakuya-cursors";
      icon-theme = "Qogir-dark";
      #      gtk-theme = "Flat-Remix-GTK-Grey-Light-Solid";
      font-name = "Liberation Sans 12";
      document-font-name = "GohuFont Nerd Font Mono 12";
      monospace-font-name = "GohuFont Nerd Font Mono 12";
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      #   picture-uri = "file:///home/lucio/.background-image";
      #    picture-uri-dark = "file:///home/lucio/.background-image";
      #     primary-color = "#000000000000";
      #      secondary-color = "#000000000000";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-l.webp";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-d.webp";
      primary-color = "#77767B";
      secondary-color = "#000000";
    };

    ### MISC

    "org/gnome/desktop/privacy" = {
      old-files-age = mkUint32 7;
      recent-files-max-age = 7;
      remove-old-temp-files = true;
      remove-old-trash-files = true;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 0.0;
      night-light-schedule-to = 23.983333333333334;
      night-light-temperature = mkUint32 3700;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      sleep-inactive-ac-timeout = 2700;
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

  }; # dconf end
}

