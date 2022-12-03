{ pkgs, ... }: with pkgs;

rec {

  web = [
    yt-dlp
    brave
    claws-mail
    authenticator
  ];

  mediaed = [
    ffmpeg_5-full
    (gimp-with-plugins.override { plugins = with gimpPlugins; [ bimp ]; })
  ];

  social = [
    discord
    mumble
    teams
    #    kotatogram-desktop
  ];

  editor = [
    rnix-lsp
  ];

  viewers = [
    vlc
    fontpreview
    hakuneko
    libreoffice
    calibre
  ];

  utils = [
    droidcam
    android-tools
    detox
    taskwarrior
    tomb
    pinentry-curses
    wgetpaste
    any-nix-shell
    steam-run
    disfetch
    ventoy-bin-full
    zoxide
  ];

  theming = [
    qogir-icon-theme
    nordzy-icon-theme
    nerdfonts
  ];

  gnome = with pkgs.gnome; [
    gnome-tweaks
    pomodoro
    nautilus
    file-roller
  ] ++ [ nautilus-open-any-terminal dconf2nix ];

  gnome-extensions = with pkgs.gnomeExtensions; [
    no-activities-button
    no-overview
    blur-my-shell
    dock-from-dash
    resource-monitor
    gsconnect
    gnome-bedtime
    espresso
  ];

  base = utils ++ viewers ++ editor ;
  manipulation = mediaed ;
  connect = web ++ social;
  gnomebase = gnome ++ gnome-extensions ++ theming;
  
}


