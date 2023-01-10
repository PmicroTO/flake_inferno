{ pkgs, ... }:
with pkgs;

rec {

  web = [ yt-dlp firefox ];

  mediaed = [
    (gimp-with-plugins.override { plugins = with gimpPlugins; [ bimp ]; })
    handbrake
  ];

  organization = [ thunderbird logseq ];

  social = [
    discord
    # kotatogram-desktop
  ];

  editor = [
    gnome-text-editor
    ###hx
    helix
    wl-clipboard
    xclip
    nil
    nixfmt
    nodePackages.bash-language-server
    texlab
    (python310.withPackages (ps:
      with ps; [
        python-lsp-server
        autopep8
        rope
        pycodestyle
        pyflakes
        mccabe
      ]))
  ];

  viewers = [ vlc imv fontpreview hakuneko ];

  documents = [ scantailor-advanced libreoffice evince ];

  gutils = [ bottles easyeffects pika-backup bitwarden ];

  utils = [
    nnn
    ffmpeg_5-full
    playerctl
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
    mcfly
  ];

  bury = [ tomb pinentry-curses ];

  theming = [ qogir-icon-theme nordzy-icon-theme nerdfonts ];

  gnome = with pkgs.gnome;
    [ gnome-boxes gnome-tweaks file-roller seahorse pomodoro ] ++ [ dconf2nix ]
    ++ [
      # nautilus  
      nautilus
      xfce.tumbler
      webp-pixbuf-loader
      poppler_gi
      ffmpegthumbnailer
      gst_all_1.gst-libav
      gst_all_1.gst-plugins-ugly
      libgsf
    ];

  gnome-extensions = with pkgs.gnomeExtensions; [
    dash-to-panel
    #    gsconnect
    gnome-bedtime
    espresso
    disable-unredirect-fullscreen-windows
  ];

  base = utils ++ gutils ++ viewers ++ editor ++ organization ++ bury
    ++ documents;
  manipulation = mediaed;
  connect = web ++ social;
  gnomebase = gnome ++ gnome-extensions ++ theming;
}
