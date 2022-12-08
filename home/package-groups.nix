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
    libreoffice
    mupdf
  ];

  utils = [
    powerline
    bottles
    zip
    rar
    p7zip
    scantailor-advanced
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
    gnome-boxes
    gnome-tweaks
    nautilus
    file-roller
    seahorse
  ] ++ [ dconf2nix gnome-solanum gnome-text-editor easyeffects tdrop ];

  gnome-extensions = with pkgs.gnomeExtensions; [
    gsconnect
    gnome-bedtime
    espresso
    no-overview
    no-activities-button
    gnomeExtensions.another-window-session-manager
  ];

  base = utils ++ viewers ++ editor ++ organization;
  manipulation = mediaed;
  connect = web ++ social;
  gnomebase = gnome ++ gnome-extensions ++ theming;

}


