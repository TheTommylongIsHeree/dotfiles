{ config, pkgs, ... }:

let
  zjstatus = pkgs.fetchurl {
    url = "https://github.com/dj95/zjstatus/releases/latest/download/zjstatus.wasm";
    sha256 = "sha256-TeQm0gscv4YScuknrutbSdksF/Diu50XP4W/fwFU3VM=";
  };
in
{
  programs.zellij = {
    enable = true;
  };

  home.file.".config/zellij/plugins/zjstatus.wasm".source = zjstatus;
  
  xdg.configFile."zellij/layouts/catppuccin.kdl".text = ''
    layout {
        pane
        pane size=1 borderless=true {
            plugin location="file:${zjstatus}" {
                color_bg "#1e1e2e"
                color_fg "#cdd6f4"
                color_crust "#11111b"
                color_maroon "#f38ba8"
                color_blue "#89b4fa"
                color_green "#a6e3a1"
                color_surface1 "#45475a"
                color_sky "#89dceb"

                format_left  "#[fg=$surface1,bg=$bg]{tabs}#[fg=$surface1,bg=$bg]"
                format_right "#[fg=$green,bg=$bg]#[fg=$crust,bg=$green] #[fg=$fg,bg=$surface1] {session}#[fg=$surface1,bg=$bg] #[fg=$sky,bg=$bg]#[fg=$crust,bg=$sky]󱎫 #[fg=$fg,bg=$surface1] {command_uptime}#[fg=$surface1,bg=$bg]"
                format_space "#[bg=$bg]"

                tab_normal              "#[fg=$fg,bg=$surface1] {index} {name} "
                tab_active              "#[fg=$crust,bg=$sky,bold] {index} {name} "

                command_uptime_command  r#"bash -c "uptime -p | sed 's/up //; s/ hours,/h/; s/ minutes/m/; s/ minute/m/; s/ hour,/h/'""#
                command_uptime_format   "{stdout}"
                command_uptime_interval "60"
            }
        }
    }
  '';
}
