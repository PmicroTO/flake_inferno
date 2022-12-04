{ config, pkgs, ... }:

{
  home.file = {

    ".local/share/applications/fish.desktop".source = ./desktop-entries/fish.desktop;
    ".local/share/applications/cups.desktop".source = ./desktop-entries/cups.desktop;
    ".config/helix/config.toml".source = ./config/helix/config.toml;


    ".face" = {
      source = pkgs.fetchurl {
        url = "https://nitter.net/pic/media%2FFN_lMoOVUAAnVUd.jpg";
        sha256 =
          "a476548d48768690f44fd8c67f0a566224112bc1003a3a9fa6b3edc18d8bc14e";
      };
    };

    ".background-image" = {
      source = pkgs.fetchurl {
        url =
          "https://w.wallhaven.cc/full/13/wallhaven-13g2qw.jpg";
        sha256 =
          "1y8ld6qjybcksdq6l4pf62khgycwv4kwyvjzc2r2p0mbcgfnyzcp";
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

    "tpm" = {
      source = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tpm";
        rev = "b699a7e01c253ffb7818b02d62bce24190ec1019";
        sha256 = "1395fv70gxkpqswnraw50fcaawnjn91j4a44yzz1c3vmm3jp4r38";
      };
      target = ".tmux/plugins/tpm";
    };

  };
}


