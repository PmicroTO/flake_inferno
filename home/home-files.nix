{ config, pkgs, ... }:

{
  home.file = {

    ".config/helix/config.toml".source = ./config/helix/config.toml;
    ".config/helix/languages.toml".source = ./config/helix/languages.toml;
    ".fkcam.webm".source = ./fkcam.webm;

    ".face" = {
      source = pkgs.fetchurl {
        url = "https://nitter.net/pic/media%2FFN_lMoOVUAAnVUd.jpg";
        sha256 =
          "a476548d48768690f44fd8c67f0a566224112bc1003a3a9fa6b3edc18d8bc14e";
      };
    };

    ".background-image" = {
      source = pkgs.fetchurl {
        url = "https://w.wallhaven.cc/full/13/wallhaven-13g2qw.jpg";
        sha256 = "1y8ld6qjybcksdq6l4pf62khgycwv4kwyvjzc2r2p0mbcgfnyzcp";
      };
    };

    "Sakuya-cursors" = {
      source = pkgs.fetchzip {
        url = "https://0x0.st/o4wb.zip";
        sha512 =
          "1l4l9i0v1n4c4p9047wywhcwr4kdir1lrl34pi1fjbswgvsjyzwmjrxqy1zjihz3prpck040mdxaimqcmhzn9icz93221ids6rvvk33";
      };
      target = ".local/share/icons/Sakuya-cursors";
    };

    ".local/share/applications/fish.desktop".source = ./config/hide.desktop;

    ".local/share/applications/cups.desktop".source = ./config/hide.desktop;

    ".local/share/VeroptBR3215AOC.oxt".source = pkgs.fetchurl {
      url =
        "https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VeroptBR3215AOC.oxt";
      sha256 = "1vhh09867gcrkbdcnzd89zx7d60q2g32ybapifgnkmd0mbca6wbm";
    };

  };
}

