{ config, ... }: {
  # programs.git = {

  # };
  programs.gh = {
    enable = true;
    settings = {
      editor = "nvim";
    };
    gitCredentialHelper = {
      enable = true;
      hosts = [ "github.com" "gitlab.com" "bitbucket.org" ];
    };
  };
}