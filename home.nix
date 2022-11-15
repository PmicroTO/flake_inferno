{ config, pkgs, lib, ... }:

{
		programs.home-manager.enable = true;
		home = { 
			username = "lucio";
			homeDirectory = "/home/lucio";
			stateVersion = "22.11";
			sessionVariables = {
				EDITOR = "vi";
				VISUAL = "vi";
			};
		
		};
		nixpkgs.config.allowUnfree = true;
		nixpkgs.config.allowUnfreePredicate = (pkg: true);
		home.packages = (with pkgs ;[
		nerdfonts
		steam-run
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
		zoxide
		]) ++ (with pkgs.gnomeExtensions ;[
		gsconnect
 		gnome-bedtime
		espresso
		material-shell
 		]); #end.packages
		programs.fish ={
			enable = true;
			plugins = [
				{ 
    					name = "hydro";
					src = pkgs.fetchFromGitHub {
					owner = "jorgebucaro";
					repo = "hydro";
					rev = "d4c107a2c99d1066950a09f605bffea61fc0efab";
					sha256 = "1ajh6klw1rkn2mqk4rdghflxlk6ykc3wxgwp2pzfnjd58ba161ki";
					};
				}

			];
			ShellInit = "
			zoxide init fish | source \
			";
			interactiveShellInit = "
				   " set BASE16_SHELL "$HOME/.config/base16-shell/" "
				    " source "$BASE16_SHELL/profile_helper.fish" "
			";
			
		};
		home.shellAliases = {
			taskpurge = "task $(task uuids due.before:now) purge";
			opvault = "ecryptfs-mount-private ; sleep 300 ; ecryptfs-umount-private";	
			ls = "ls -A --color=auto -cltp --si --group-directories-first";			
			flkhr = "home-manager switch --max-jobs 8 --flake /home/lucio/Projects/flake_inferno#lucio";
			flkup = "sudo nixos-rebuild switch -j 8 --verbose --upgrade --flake /home/lucio/Projects/flake_inferno/";
			flkre = "sudo nixos-rebuild switch -j 8 --verbose --flake /home/lucio/Projects/flake_inferno/";
			listports = "sudo netstat -tulpn | grep LISTEN ";
		};
		programs.tmux = {
			enable = true;
			baseIndex = 1;
			clock24 = true;
			keyMode = "vi";
			newSession = true;
			prefix = "C-space";
			terminal = "tmux-256color";
			extraConfig = "
				set -g allow-passthrough 1
				set -g @plugin 'tmux-plugins/tpm'
				set -g @plugin 'wfxr/tmux-power'
				set -g @tmux_power_theme 'snow'
				run '~/.tmux/plugins/tpm/tpm'

			";

		};
		programs.neovim = {
			enable = true;
			viAlias = true;
			vimAlias = true;
			vimdiffAlias = true;
			withPython3 = true;
			extraPython3Packages = (ps: with ps; [ python-lsp-server ]);
			extraPackages = (with pkgs ;[ sqls ccls ]);
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
				url = "https://raw.githubusercontent.com/wnxkiv85/flake_inferno/main/wallpaper.jpeg"; 
				sha256 = "c11872838c13eaab4a128541a9413526b629e6ed7027b9ac67bb4a5fe0c30284";
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
			"tpm" = {
				source = pkgs.fetchFromGitHub {
				owner = "tmux-plugins";
				repo = "tpm";
				rev = "b699a7e01c253ffb7818b02d62bce24190ec1019";
				sha256 = "1395fv70gxkpqswnraw50fcaawnjn91j4a44yzz1c3vmm3jp4r38";
				};
				target = ".tmux/plugins/tpm";
			};
		};
}
