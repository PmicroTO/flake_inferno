{ config, pkgs, ... }:

{ 
    boot = {
	loader.systemd-boot = { 
		enable = true;
		consoleMode = "max";
		memtest86.enable = true;
		};
    	kernelPackages = pkgs.linuxPackages_latest;
    	extraModulePackages = ( with config.boot.kernelPackages; [ 
		    			rtl88x2bu
    					]) ++ ( with pkgs; [ 
								ecryptfs
					    		 	]); 
 		};
    environment.systemPackages = ( with config.boot.kernelPackages; [
		kernel
		rtl88x2bu
]) ++ ( with pkgs ; [ ddcutil ]);
	boot = {
		kernelParams = [ "amd_iommu=off" "iommu=soft" "quiet" "udev.log_level=3" "loglevel=3"];
		consoleLogLevel = 0;
		initrd.verbose = false;
		kernelModules = [ "ecryptfs" ];
		supportedFilesystems = [ "ecryptfs" ];
		};
	hardware.i2c.enable = true;
	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 7d";
		};
}
