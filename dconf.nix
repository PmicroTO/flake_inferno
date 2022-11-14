{ config, lib, ... }: 

with lib.hm.gvariant;

{

	dconf.settings = {
		"org/gnome/desktop/peripherals/trackball" = { scroll-wheel-emulation-button = 8; };
		
		"org/gnome/desktop/interface" = { 
				cursor-theme = "Sakuya-cursors";
				icon-theme = "Nordzy-pink";
				document-font-name = "FiraCode Nerd Font Mono Light 12";
				font-name = "Liberation Sans 11";
				monospace-font-name = "FiraCode Nerd Font Mono Light 12";
				gtk-theme = "adw-gtk3";
				};

		"org/gnome/system/locale" = { region = "pt_BR.UTF-8"; };

		"org/gnome/shell" = {
				enabled-extensions = [ "gnomebedtime@ionutbortis.gmail.com" "espresso@coadmunkee.github.com" "gsconnect@andyholmes.github.io" "material-shell@papyelgringo" ];
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
		"org/gnome/desktop/wm/preferences" = {
				num-workspaces = 1;
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
		
	"org/gnome/shell/extensions/materialshell/bindings" = {
      cycle-tiling-layout = [ "<Super>w" ];
      kill-focused-window = "<Super>q";
      last-workspace = [ "<Super>z" ];
      move-window-bottom = [ "<Super><Shift>j" ];
      move-window-left = [ "<Super><Shift>l" ];
      move-window-monitor-down = [ "" ];
      move-window-monitor-left = [ "" ];
      move-window-monitor-right = [ "" ];
      move-window-monitor-up = [ "" ];
      move-window-right = [ "<Shift><Super>h" ];
      move-window-top = [ "<Shift><Super>k" ];
      next-window = [ "<Super>l" ];
      next-workspace = [ "<Super>j" ];
      previous-window = [ "<Super>h" ];
      previous-workspace = [ "<Super>k" ];
    };

    "org/gnome/shell/extensions/materialshell/layouts" = {
      default-layout = "grid";
      float = false;
      grid = true;
      half = false;
      split = false;
    };

    "org/gnome/shell/extensions/materialshell/theme" = {
      blur-background = false;
      clock-app-launcher = false;
      clock-horizontal = false;
      focus-effect = "border";
      horizontal-panel-position = "bottom";
      panel-icon-color = false;
      panel-icon-style = "application";
      panel-opacity = 100;
      panel-size = 48;
      primary-color = "#9a9996";
      taskbar-item-style = "icon";
      theme = "dark";
      vertical-panel-position = "left";
    };

    "org/gnome/shell/extensions/materialshell/tweaks" = {
      cycle-through-windows = true;
      cycle-through-workspaces = true;
      disable-notifications = true;
    };		
    
	"org/gnome/desktop/background" = {
				color-shading-type = "solid";
				picture-options = "zoom";
				picture-uri = "file:///home/lucio/.background-image";
				picture-uri-dark = "file:///home/lucio/.background-image";
				primary-color = "#000000000000";
				secondary-color = "#000000000000";
				};

	}; #dconf end
}

