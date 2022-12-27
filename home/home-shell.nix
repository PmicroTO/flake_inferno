{ config, pkgs, lib, ... }:
{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -U fish_greeting
      set -U fish_vi_key_bindings   
    '';
    interactiveShellInit = ''
            any-nix-shell fish --info-right | source
            zoxide init fish | source
      mcfly init fish | source  
    '';
    functions = {
      to = {
        body = '' 
          tomb open $HOME/user-dirs/tomb/personal.tomb -k $HOME/user-dirs/tomb/personal.tomb.key
          sleep 600;
          tomb slam all    
        '';
      };
    };
  };
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  home.shellAliases = {
    taskpurge = "task $(task uuids due.before:now) purge";
    ls = "ls -A --color=auto -cltp --si --group-directories-first";
    flkhr =
      "home-manager switch --max-jobs 8 --flake $XDG_GIT_DIR/flake_inferno#lucio";
    flkup =
      "sudo nixos-rebuild switch -j 8 --verbose --upgrade --flake $XDG_GIT_DIR/flake_inferno#inferno --recreate-lock-file";
    flkre =
      "sudo nixos-rebuild switch -j 8 --verbose --flake $XDG_GIT_DIR/flake_inferno#inferno";
    listports = "sudo netstat -tulpn | grep LISTEN ";
    wp = "wgetpaste";
    ".." = "cd ..";
    #	webmloo = "for i in *.webm; do ffmpeg -stream_loop -1 -t 5 -i \"$i\" -c copy \"\${i%.*}_5.webm\"; done";
    #to = "tomb open $HOME/user-dirs/tomb/personal.tomb -k $HOME/user-dirs/tomb/personal.tomb.key ; sleep 600 ; tomb slam all";
    slam = "tomb slam all";
    g = "git";
    gc = "git commit -a";
    ga = "git add -A";
    gp = "git push";
    py = "python3";
    n = "nnn";
  };
}


