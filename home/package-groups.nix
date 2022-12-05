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
    helix
    rnix-lsp
    nodePackages.bash-language-server
    texlab
    (python3.withPackages
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
    fontpreview
    hakuneko
    libreoffice
    mupdf
  ];

  utils = [
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
    gnome-tweaks
    nautilus
    file-roller
    seahorse
  ] ++ [ dconf2nix image-roll gnome-solanum endeavour ];

  gnome-extensions = with pkgs.gnomeExtensions; [
    just-perfection
    no-activities-button
    no-overview
    dock-from-dash
    gsconnect
    gnome-bedtime
    espresso
    dash-to-panel
    tiling-assistant
  ];

  base = utils ++ viewers ++ editor;
  manipulation = mediaed;
  connect = web ++ social;
  gnomebase = gnome ++ gnome-extensions ++ theming;

}


