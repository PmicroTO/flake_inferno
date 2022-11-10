{
	description = "my machine";
	inputs = { 
			nixpkgs.url = "github:nixos/nixpkgs/master";
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
      homeConfigurations.lucio = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      }; 

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
	system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
  };
}
