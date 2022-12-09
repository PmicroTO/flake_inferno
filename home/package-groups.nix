{ pkgs, ... }: with pkgs;

rec {

  web = [
    yt-dlp
    brave
    librewolf
    authenticator
  ];

  mediaed = [
    ffmpeg_5-full
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
    #    kotatogram-desktop
  ];

  editor = [
    helix
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
    mupdf
  ];

  documents = [
    scantailor-advanced
    libreoffice
  ];

  gutils = [
    bottles
    easyeffects
  ];

  utils = [
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
    nautilus
    file-roller
    seahorse
  ] ++ [ dconf2nix gnome-text-editor workrave ];

  gnome-extensions = with pkgs.gnomeExtensions; [
    dash-to-panel
    gsconnect
    gnome-bedtime
    espresso
    no-overview
    no-activities-button
    gnomeExtensions.another-window-session-manager
  ];

  base = utils ++ gutils ++ viewers ++ editor ++ organization ++ bury ++ documents;
  manipulation = mediaed;
  connect = web ++ social;
  gnomebase = gnome ++ gnome-extensions ++ theming;
}


