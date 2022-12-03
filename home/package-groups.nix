{ pkgs, ... }: with pkgs;

rec {

  web = [
    yt-dlp
    brave
    thunderbird
    authenticator
    tidal-hifi
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
    clapper
    fontpreview
    hakuneko
    libreoffice
    calibre
  ];

  utils = [
    radeontop
    bottom
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
  ] ++ [ dconf2nix image-roll ];

  gnome-extensions = with pkgs.gnomeExtensions; [
    no-activities-button
    no-overview
    dock-from-dash
    gsconnect
    gnome-bedtime
    espresso
    forge
  ];

  base = utils ++ viewers ++ editor;
  manipulation = mediaed;
  connect = web ++ social;
  gnomebase = gnome ++ gnome-extensions ++ theming;

}


