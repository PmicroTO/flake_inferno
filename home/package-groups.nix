{ pkgs, ... }: with pkgs;

rec {

  web = [
    yt-dlp
    brave
    thunderbird
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
    nodePackages.bash-language-server
    python39Packages.python-lsp-server
    texlab
  ];

  viewers = [
    clapper
    fontpreview
    hakuneko
    libreoffice
    calibre
    bookworm
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
    nautilus
    file-roller
  ] ++ [ dconf2nix image-roll gnome-solanum ];

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


