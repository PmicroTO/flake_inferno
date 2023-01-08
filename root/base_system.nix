{ config, pkgs, ... }:

{

  services.flatpak.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  environment.systemPackages = with pkgs;
    [
      (pkgs.systemd.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Doptimization=3" ];
      }))
    ];

  time.timeZone = "America/Fortaleza";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {

      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "en_GB.UTF-8";

    };
  };

  users.users.lucio = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "i2c" ];
    shell = pkgs.fish;
  };

  programs = {
    fish.enable = true;
    droidcam.enable = true;

  };
  environment = {
    pathsToLink = [ "/share/fish" ];
    shells = with pkgs; [ fish ];
  };

  services = {
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };

    fstrim = {
      enable = true;
      interval = "weekly";
    };
    udev.extraRules =
      "\n		ACTION==\"add|change\", KERNEL==\"sd[a-z]*\", ATTR{queue/rotational}==\"0\", ATTR{queue/scheduler}=\"none\" \n		ACTION==\"add|change\", KERNEL==\"sd[a-z]*\", ATTR{queue/rotational}==\"1\", ATTR{queue/scheduler}=\"bfq\"\n		";
  };

  security.sudo.wheelNeedsPassword = false;

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "	experimental-features = nix-command flakes\n";
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  documentation.doc.enable = false;

  system.stateVersion = "22.05";

}
