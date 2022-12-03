{ config, pkgs, ... }:

{
  home.file = {
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
          "https://w.wallhaven.cc/full/39/wallhaven-39m7r6.jpg";
        sha256 =
          "0ndadcyqhwjv54m1qb7jlk7jg61p0fck8z4w37z4rbl0zklb5s4l";
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

    "base16-shell-master" = {
      source = pkgs.fetchzip {
        url =
          "https://github.com/chriskempson/base16-shell/archive/refs/heads/master.zip";
        sha512 =
          "0c0lm47wwcqd2lc0293awr8kvpib8pcq1kgnilnbg0d2g0b65if0aj0yrmv1sg3z78c15ssksv9j7ikbhhwifdg3360ypk2plrfyrny";
      };
      target = ".config/base16-shell";
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


