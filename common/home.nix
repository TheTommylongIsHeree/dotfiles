{ pkgs, ... }: {
  catppuccin.enable = true;
  catppuccin.flavor = "mocha";
  catppuccin.accent = "sky";

  programs.home-manager.enable = true;
  imports = [
    ./fish.nix
    ./alacritty.nix
    ./vscode.nix
    ./starship.nix
    ./zellij.nix
  ];
}
