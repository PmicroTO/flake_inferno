{ config, pkgs, libs, ... }: 

{

	dconf.settings = {
		"org/gnome/desktop/peripherals/trackball" = { scroll-wheel-emulation-button = 9; };


		
	}; #dconf end



}

