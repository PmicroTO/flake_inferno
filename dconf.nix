{ config, lib, ... }: 

with lib.hm.gvariant;

{

	dconf.settings = {
		"org/gnome/desktop/peripherals/trackball" = { scroll-wheel-emulation-button = 8; };
		
		"org/gnome/desktop/interface" = { 
				cursor-theme = "Sakuya-cursors";
				icon-theme = "Nordzy-pink";
				document-font-name = "Liberation Serif 13";
				font-name = "Liberation Sans 11";
				monospace-font-name = "SauceCodePro Nerd Font Mono 11";
				gtk-theme = "adw-gtk3";
				};

		"org/gnome/system/locale" = { region = "pt_BR.UTF-8"; };
		
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
		"org/gnome/desktop/wm/preferences" = {
				num-workspaces = 4;
				};

		"org/gnome/desktop/input-sources" = {
				sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "us+alt-intl" ]) ];
				xkb-options = [ "terminate:ctrl_alt_bksp" "caps:swapescape" ];
				};

		"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
				binding = "<Shift><Super>minus";
				command = "ddcutil setvcp 10 - 20";
				name = "backlightdown";
				};
		"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
				binding = "<Shift><Super>equal";
				command = "ddcutil setvcp 10 + 20";
				name = "backlightup";
				};
		"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
				binding = "<Super>Return";
				command = "kgx";
				name = "terminal";
				};

"org/gnome/shell/extensions/dash-to-panel" = {
      animate-appicon-hover-animation-extent = "{'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}";
      appicon-margin = 6;
      appicon-padding = 4;
      available-monitors = [ 0 ];
      dot-position = "BOTTOM";
      dot-style-focused = "DOTS";
      dot-style-unfocused = "DOTS";
      group-apps = true;
      hide-overview-on-startup = true;
      hotkeys-overlay-combo = "TEMPORARILY";
      leftbox-padding = -1;
      overview-click-to-exit = false;
      panel-anchors = ''
        {"0":"MIDDLE"}
      '';
      panel-element-positions = ''
        {"0":[{"element":"showAppsButton","visible":true,"position":"centerMonitor"},{"element":"activitiesButton","visible":false,"position":"centered"},{"element":"leftBox","visible":false,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":false,"position":"centerMonitor"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}]}\n
      '';
      panel-lengths = ''
        {"0":100}
      '';
      panel-positions = ''
        {"0":"BOTTOM"}\n
      '';
      panel-sizes = ''
        {"0":48}
      '';
      primary-monitor = 0;
      progress-show-count = false;
      show-appmenu = false;
      show-favorites = true;
      show-running-apps = true;
      status-icon-padding = -1;
      stockgs-keep-top-panel = false;
      trans-bg-color = "#323232";
      trans-panel-opacity = 0.95;
      trans-use-custom-bg = true;
      trans-use-custom-opacity = false;
      tray-padding = -1;
      window-preview-title-position = "TOP";
    };

	}; #dconf end



}

