{ config, pkgs, libs, ... }:

{
	environment.pathsToLink = [ "/share/zsh" ];
	users.users.lucio.shell = pkgs.zsh;
	environment.shells = with pkgs; [ zsh ];
	home-manager.users.lucio = { lib, ... }: with lib.hm.gvariant; {
		home.stateVersion = "22.11";
		home.packages = (with pkgs ;[
		gnome.geary
		brave
		calibre
		transmission-gtk
		pika-backup
		vlc
		authenticator	
		nordzy-icon-theme
		disfetch
		ventoy-bin-full
		taskwarrior
		steam-run
		dconf2nix
		arcanPackages.espeak
		detox
		hakuneko
		gnome-console
		adw-gtk3
		ecryptfs
		ecryptfs-helper
		droidcam
		webcamoid
		gnome.pomodoro
		]) ++ (with pkgs.gnomeExtensions ;[
 		gnome-bedtime
		espresso
		dash-to-panel
 		]); #end.packages
		programs.zsh ={
			enable = true;
			enableAutosuggestions = true;
			enableCompletion =true;
			enableSyntaxHighlighting = true;
			dotDir = ".config/zsh";
			oh-my-zsh= {
				enable = true;
				theme = "alanpeabody";
			};
			shellAliases = {
				ls = "ls -A --color=auto -cltp --si --group-directories-first";
				otcry = "sudo cryptsetup tcryptOpen";
				ctcry = "sudo cryptsetup tcryptClose";
				oluks = "sudo cryptsetup luksOpen";
				cluks = "sudo cryptsetup luksClose";
				nluks = "cryptsetup --type luks -c serpent-xts-plain64 -s 512 --hash whirlpool luksFormat";
				taskpurge = "task $(task uuids due.before:now) purge";
				opvault = "ecryptfs-mount-private ; sleep 300 ; ecryptfs-umount-private";
				rebuildflake = "sudo nixos-rebuild switch -j 8 --flake /home/lucio/Projects/flake_inferno";
				updateflake = "sudo nixos-rebuild switch -j 8 --upgrade --flake /home/lucio/Projects/flake_inferno";
			};
		};
		programs.git = {
			enable = true;
			userEmail = "8f2w79@getgoogleoff.me";
			userName = "wnxkiv85";		
		};
		home.file = {
			".face" = {
				source = pkgs.fetchurl { 
				url = "https://nitter.net/pic/media%2FFN_lMoOVUAAnVUd.jpg"; 
				sha256 = "a476548d48768690f44fd8c67f0a566224112bc1003a3a9fa6b3edc18d8bc14e";
						};
			};
			".background-image" = {
				source = pkgs.fetchurl { 
				url = "https://images3.alphacoders.com/784/784785.png"; 
				sha256 = "7991fea419fecd3f17f90037ea4e1e227aa9b9f97b2196f1c66429c41da7122d";
						};
			};
			"Sakuya-cursors" = {
				source = pkgs.fetchzip { 
				url = "https://0x0.st/o4wb.zip"; 
				sha512 = "1l4l9i0v1n4c4p9047wywhcwr4kdir1lrl34pi1fjbswgvsjyzwmjrxqy1zjihz3prpck040mdxaimqcmhzn9icz93221ids6rvvk33";
						};
				target = ".local/share/icons/Sakuya-cursors";
			};

			"base16-shell-master" = {
				source = pkgs.fetchzip {
				url = "https://github.com/chriskempson/base16-shell/archive/refs/heads/master.zip" ;
				sha512 = "0c0lm47wwcqd2lc0293awr8kvpib8pcq1kgnilnbg0d2g0b65if0aj0yrmv1sg3z78c15ssksv9j7ikbhhwifdg3360ypk2plrfyrny";	
				};
				target = ".config/base16-shell-master";
			};
		};
		
	}; #fimuser.lucio
}
