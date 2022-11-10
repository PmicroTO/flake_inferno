{
	description = "my machine";
	inputs = { 
			nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
			home-manager = {
				url = "github:nix-community/home-manager";
				inputs.nixpkgs.follows = "nixpkgs";
			};
		
		};
  outputs = { self, nixpkgs, home-manager, ... }: 
  
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in
	
  {
    nixosConfigurations.inferno = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules =
        [ 
            	./base_system.nix
		./boot.nix
		./gnome.nix
		./hardware-configuration.nix
		./networking.nix
		./pipewire_conf.nix
		./pipewire.nix
        ];
    };
      homeConfigurations.lucio = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
        ];
      };
	system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
  };
}
