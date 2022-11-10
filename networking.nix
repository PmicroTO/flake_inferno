{ config, pkgs, ...}:

{
	networking.hostName = "inferno";
	services.printing = { 
		enable = true; 
		drivers = [ pkgs.epson-escpr ];
		};
	services.avahi = { 
		enable = true;
		nssmdns = true; 
		openFirewall = true;
		};
	networking = {
		nameservers = [ "127.0.0.1" "::1" ];
		networkmanager.enable = true;
		networkmanager.dns = "none";
		};
	services.nextdns = {
		enable = true;
		arguments = [ "-config" "cc6b68" "-cache-size" "20MB" ];
		};
	programs.ssh.startAgent = true;

		networking.firewall = {
			enable = true;
			allowedTCPPorts = [ 8554 4747 ];
			allowedUDPPorts = [];
			};
	services = { 
		transmission.openFirewall = true;
		taskserver.openFirewall = true;
		};
}
