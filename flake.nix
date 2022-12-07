{
  description = "my machine";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
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
          ./home/home-shell.nix
          ./home/home-files.nix
          ./home/home.nix
          ./home/dconf.nix
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
          ./root/pipewire.nix
          ./root/containers.nix
        ];
      };

      devShells.x86_64-linux.default = import ./shell.nix { inherit pkgs; };

      system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;

    };
}
