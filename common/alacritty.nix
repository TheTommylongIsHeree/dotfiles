# alacritty.nix
{ pkgs, inputs, ... }:

let
  nixGL = inputs.nixgl.packages.${pkgs.system}.nixGLIntel;

  alacritty-wrapped = pkgs.runCommand "alacritty-nixgl" {
    buildInputs = [ pkgs.makeWrapper ];
  } ''
    mkdir -p $out/bin
    makeWrapper ${nixGL}/bin/nixGLIntel $out/bin/alacritty \
      --add-flags "${pkgs.alacritty}/bin/alacritty"
  '';
in
{
  programs.alacritty = {
    enable = true;
    package = alacritty-wrapped;  # ← only change to your existing config

    settings = {
      env = {
        TERM = "xterm-256color";
        SHELL = "${pkgs.fish}/bin/fish";
      };
      window = {
        padding = { x = 30; y = 20; };
        decorations = "None";
        opacity = 0.95;
      };
      font = {
        normal = { family = "JetBrains Mono Nerd Font"; style = "Regular"; };
        size = 11.0;
      };
      terminal.shell = {
        program = "${pkgs.zellij}/bin/zellij";
        args = [ "--layout" "catppuccin" "attach" "-c" "main" ];
      };
    };
  };
}