{ config, ... }:

{
  services.calibre-web = {
    enable = true;
    user = "lucio";
    group = "users";
    openFirewall = true;
    listen = {
      port = 8083;
      ip = "127.0.0.1";
    };
    options = {
      enableBookUploading = true;
      enableBookConversion = true;
      calibreLibrary = "/home/lucio/user-dirs/docs/calibre-library";
    };
  };
}
