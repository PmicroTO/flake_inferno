{ pkgs, ... }: with pkgs;

rec {

  web = [
    yt-dlp
    librewolf
  ];

  mediaed = [
    (gimp-with-plugins.override { plugins = with gimpPlugins; [ bimp ]; })
    handbrake
  ];

  organization = [
    thunderbird
    logseq
  ];

  social = [
    discord
    mumble
    teams
    kotatogram-desktop
  ];

  editor = [
    gnome-text-editor

    ###hx
    helix
    wl-clipboard
    xclip

    rnix-lsp
    nodePackages.bash-language-server
    texlab
    (python310.withPackages
      (ps: with ps; [
        python-lsp-server
        autopep8
        rope
        pycodestyle
        pyflakes
        mccabe
      ]))
  ];

  viewers = [
    clapper
    imv
    fontpreview
    hakuneko
  ];

  documents = [
    scantailor-advanced
    libreoffice
    #    mupdf #too slugish
    sioyek
  ];

  gutils = [
    bottles
    easyeffects
    pika-backup
  ];

  utils = [
    nnn
    ffmpeg_5-full
    zip
    rar
    p7zip
    radeontop
    bottom
    droidcam
    android-tools
    detox
    taskwarrior
    wgetpaste
    any-nix-shell
    steam-run
    appimage-run
    disfetch
    ventoy-bin-full
    zoxide
  ];

  bury = [
    tomb
    pinentry-curses
  ];

  theming = [
    qogir-icon-theme
    nordzy-icon-theme
    nerdfonts
  ];

  gnome = with pkgs.gnome; [
    gnome-boxes
    gnome-tweaks
    file-roller
    seahorse
    pomodoro
  ] ++ [
    dconf2nix
  ];

  gnome-extensions = with pkgs.gnomeExtensions; [
    dash-to-panel
    #    gsconnect
    gnome-bedtime
    espresso
    disable-unredirect-fullscreen-windows
  ];

  base = utils ++ gutils ++ viewers ++ editor ++ organization ++ bury ++ documents;
  manipulation = mediaed;
  connect = web ++ social;
  gnomebase = gnome ++ gnome-extensions ++ theming;
}


