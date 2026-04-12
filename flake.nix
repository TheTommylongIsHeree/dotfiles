{
  description = "TheTommylong's Configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    catppuccin.url = "github:catppuccin/nix";
    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = { nixpkgs, catppuccin, home-manager, ... }@inputs: 
  let
    system = "x86_64-linux"; # Use "aarch64-darwin" later for your Mac!
    pkgs = import nixpkgs {
      system = system;
      config.allowUnfree = true;
    };
    username = "tommylong";
  in {
    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      modules = [
        {
          home.username = username;
          home.homeDirectory = if pkgs.stdenv.isDarwin
                               then "/Users/${username}"
                               else "/home/${username}";
          home.stateVersion = "23.11";
        }
        ./common/home.nix
        catppuccin.homeModules.catppuccin
      ];
      pkgs = pkgs;
      extraSpecialArgs = {
        inherit inputs;
      };
    };
  };
}
