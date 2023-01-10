{
  description = "my machine";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nix-alien.url = "github:thiagokokada/nix-alien";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-master, home-manager, ... }:
    let
      system = "x86_64-linux";
      allowUnfree = {
        nixpkgs.config = {
          allowUnfree = true;
          allowUnfreePredicate = (pkg: true);
        };
      };
      pkgs = nixpkgs.legacyPackages.${system};
      overlay-master = final: prev: {
        master = nixpkgs-master.legacyPackages.${prev.system};
      };
    in {
      homeConfigurations.lucio = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-master ]; })
          allowUnfree
          ./home/home-shell.nix
          ./home/home-files.nix
          ./home/home.nix
          ./home/dconf.nix
        ];
      };

      nixosConfigurations.inferno = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit self system; };
        modules = [
          ./root/base_system.nix
          ./root/boot.nix
          ./root/gnome.nix
          ./root/hardware-configuration.nix
          ./root/networking.nix
          ./root/pipewire.nix
          ./root/containers.nix
          ({ self, system, ... }: {
            environment.systemPackages = with pkgs;
              with self.inputs.nix-alien.packages.${system}; [
                nix-alien
                nix-index # not necessary, but recommended
                nix-index-update
              ];
            # Optional, needed for `nix-alien-ld`
            programs.nix-ld.enable = true;
          })
        ];
      };

      devShells.x86_64-linux.default = import ./shell.nix { inherit pkgs; };
      system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
    };
}
