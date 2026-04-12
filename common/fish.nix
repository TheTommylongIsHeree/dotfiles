{ pkgs, ... }: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting

    '';

    shellAbbrs = {
      ls = "eza --icons";
      ll = "eza --icons -@Zl";
      tree = "eza --icons -T";
      dir = "eza --icons";
      clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
      q = "qs -c ii";
      pm = "pnpm";
    };

    loginShellInit = if pkgs.stdenv.isLinux then ''
      if test -z "$DISPLAY" ;and test "$XDG_VTNR" -eq 1
          mkdir -p ~/.cache
          exec start-hyprland > ~/.cache/hyprland.log 2>&1
      end
      
      if test (tty) = /dev/tty1
          hyprdynamicmonitors prepare
          exec start-hyprland
      end
    '' else "";
  };
}
