{
  description = "my machine";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-master, home-manager, ... }:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      overlay-master = final: prev: {
        master = nixpkgs-master.legacyPackages.${prev.system};
      };
    in

    {
      homeConfigurations.lucio = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-master ]; })
          ./home/home.nix
          ./home/dconf.nix
          ./home/helix.nix
          ./home/tmux.nix
        ];
      };

      nixosConfigurations.inferno = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./root/base_system.nix
          ./root/boot.nix
          ./root/gnome.nix
          ./root/hardware-configuration.nix
          ./root/networking.nix
          #          ./pipewire_conf.nix
          ./root/pipewire.nix
        ];
      };

      devShells.x86_64-linux.default = import ./shell.nix { inherit pkgs; };

      system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;

    };
}
