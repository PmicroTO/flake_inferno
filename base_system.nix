{ config, pkgs,  ... }:

{
	
	services.flatpak.enable = true;
	virtualisation.podman = {
		enable = true;
		dockerCompat = true;	
	};	
	environment.systemPackages = with pkgs; [
		rnnoise-plugin
		nerdfonts
		nmon
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
		};
		
	environment = { 
		pathsToLink = [ "/share/zsh" ]; 
		shells = with pkgs; [ zsh ];
		};
		
	services.clamav.daemon.enable = true;
	services.clamav.updater.enable = true;

	nix = {
		package = pkgs.nixFlakes;
		extraOptions = ''
		experimental-features = nix-command flakes
	'';
	};
	
	nixpkgs.config.allowUnfree = true;

	system.stateVersion = "22.05";

}
