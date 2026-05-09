{ ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
    enableInteractive = true;
    settings = {
      add_newline = true;
      format = "$directory $all_status$fill$username$hostname$duration\n$character";

      cmd_duration = {
        min_time = 5000;
        show_milliseconds = false;
        format = "[$duration]";
      };

      fill = {
        symbol = " ";
        style = "bold green";
      };

      hostname = {
        ssh_only = false;
        format = "in $ssh_symbol[$hostname](bold red)";
        disabled = false;
      };

      username = {
        style_user = "white bold";
        style_root = "red bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };
    };
  };
}
