{ config, pkgs,  ... }:

{
	
	services.flatpak.enable = true;
	virtualisation.podman = {
		enable = true;
		dockerCompat = true;	
	};	
	environment.systemPackages = with pkgs; [
		rnnoise-plugin
		nmon
#		steam-run
		(pkgs.systemd.overrideAttrs (oldAttrs: {
				mesonFlags = oldAttrs.mesonFlags ++ [ "-Doptimization=3" ]; 
				}))
	];
	 
	time.timeZone = "America/Fortaleza";

	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "pt_BR.utf8";
		LC_IDENTIFICATION = "pt_BR.utf8";
		LC_MEASUREMENT = "pt_BR.utf8";
		LC_MONETARY = "pt_BR.utf8";
		LC_NAME = "pt_BR.utf8";
		LC_NUMERIC = "pt_BR.utf8";
		LC_PAPER = "pt_BR.utf8";
		LC_TELEPHONE = "pt_BR.utf8";
		LC_TIME = "pt_BR.utf8";
		};
 
	users.users.lucio = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" "i2c" ];
		shell = pkgs.fish;
		};
		
	programs = { 
		fish.enable = true;
		droidcam.enable = true;

	};	
	environment = { 
		pathsToLink = [ "/share/zsh" ];
		shells = with pkgs; [ fish ];
		};
		
	services = { 
		clamav = {
		daemon.enable = true; 
		updater.enable = true;
		};
		fstrim = {
		enable = true;
		interval = "weekly";
		};
		udev.extraRules = "
		ACTION==\"add|change\", KERNEL==\"sd[a-z]*\", ATTR{queue/rotational}==\"0\", ATTR{queue/scheduler}=\"none\" \
		ACTION==\"add|change\", KERNEL==\"sd[a-z]*\", ATTR{queue/rotational}==\"1\", ATTR{queue/scheduler}=\"bfq\"
		";
	};

	nix = {
		package = pkgs.nixFlakes;
		extraOptions = ''
		experimental-features = nix-command flakes
	'';
	};
		
	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.allowUnfreePredicate = (pkg: true);

	system.stateVersion = "22.05";

}
