{
  description = "TheTommylong's Configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    catppuccin.url = "github:catppuccin/nix";
    nixgl.url = "github:nix-community/nixGL";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = { nixpkgs, catppuccin, home-manager, sops-nix, ... }@inputs: 
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
        ({config, ... }: {
          home.username = username;
          home.homeDirectory = if pkgs.stdenv.isDarwin
                               then "/Users/${username}"
                               else "/home/${username}";
          home.stateVersion = "23.11";
          sops = {
            defaultSopsFile = ./secrets.sops.yaml;
            gnupg.home = "${config.home.homeDirectory}/gnupg";
            secrets.my-token = {};
          };
        })
        ./common/home.nix
        catppuccin.homeModules.catppuccin
        sops-nix.homeModules.sops
      ];
      pkgs = pkgs;
      extraSpecialArgs = {
        inherit inputs;
      };
    };
  };
}
