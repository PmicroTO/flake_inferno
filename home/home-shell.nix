{ config, pkgs, lib, ... }:
{
  programs.fish = {
    enable = true;
    shellInit = ''
      			set -U fish_greeting
      			'';
    interactiveShellInit =
      "\n                        any-nix-shell fish --info-right | source\n                        zoxide init fish | source \n                        ";
    functions = { };
  };
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  home.shellAliases = {
    taskpurge = "task $(task uuids due.before:now) purge";
    opvault = "ecryptfs-mount-private ; sleep 300 ; ecryptfs-umount-private";
    ls = "ls -A --color=auto -cltp --si --group-directories-first";
    flkhr =
      "home-manager switch --max-jobs 8 --flake /home/lucio/Projects/flake_inferno#lucio";
    flkup =
      "sudo nixos-rebuild switch -j 8 --verbose --upgrade --flake /home/lucio/Projects/flake_inferno#inferno --recreate-lock-file";
    flkre =
      "sudo nixos-rebuild switch -j 8 --verbose --flake /home/lucio/Projects/flake_inferno#inferno";
    listports = "sudo netstat -tulpn | grep LISTEN ";
    wp = "wgetpaste";
    ".." = "cd ..";
    #	webmloo = "for i in *.webm; do ffmpeg -stream_loop -1 -t 5 -i \"$i\" -c copy \"\${i%.*}_5.webm\"; done";
    to = "tomb open $HOME/tomb/personal.tomb -k $HOME/tomb/personal.tomb.key ; sleep 600 ; tomb slam all";
    slam = "tomb slam all";
  };
}


