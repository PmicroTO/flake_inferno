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
      kill-focused-window = "<Control>q";
      last-workspace = [ "<Control>z" ];
      move-window-bottom = [ "<Control><Alt>j" ];
      move-window-left = [ "<Control><Alt>l" ];
      move-window-monitor-down = [ "" ];
      move-window-monitor-left = [ "" ];
      move-window-monitor-right = [ "" ];
      move-window-monitor-up = [ "" ];
      move-window-right = [ "<Control><Alt>h" ];
      move-window-top = [ "<Control><Alt>k" ];
      next-window = [ "<Control>l" ];
      next-workspace = [ "<Control>j" ];
      previous-window = [ "<Control>h" ];
      previous-workspace = [ "<Control>k" ];

    };

    "org/gnome/shell/extensions/materialshell/layouts" = {
      default-layout = "split";
    };

    "org/gnome/shell/extensions/materialshell/theme" = {
      clock-app-launcher = false;
      focus-effect = "border";
      panel-opacity = 100;
      primary-color = "#dc8add";
      theme = "dark";
    };

    "org/gnome/shell/extensions/materialshell/tweaks" = {
      cycle-through-workspaces = true;
      disable-notifications = false;
    };		

	}; #dconf end
}

