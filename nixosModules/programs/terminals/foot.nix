{ pkgs, ... }:
{
  environment.pathsToLink = [ "share/foot" ];

  programs.foot = {
    enable = true;
    theme = "catppuccin-latte";
    settings =
    {
      main = {
        font = "FreeMono:size=32";
      };
      scrollback = {
        lines = 100000;
      };
    };
  };
}
