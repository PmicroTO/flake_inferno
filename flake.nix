{
  description = "my machine";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      # build with your own instance of nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in
    {
      homeConfigurations.lucio = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [

          hyprland.homeManagerModules.default
          { wayland.windowManager.hyprland.enable = true; }
          ./home-m/home.nix
          ./home-m/dconf.nix
          #          ./home-m/nyoom.nix
          ./home-m/nvim.nix
          #          ./home-m/nyoom-nvim.nix
        ];
      };

      nixosConfigurations.inferno = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./base_system.nix
          ./boot.nix
          ./gnome.nix
          ./hardware-configuration.nix
          ./networking.nix
          ./pipewire_conf.nix
          ./pipewire.nix
        ];
      };

      devShells.x86_64-linux.default = import ./shell.nix { inherit pkgs; };

      system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;

    };
}
