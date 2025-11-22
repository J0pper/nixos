{ pkgs, ... }:
{
  programs.river-classic = {
    enable = true; # enable river-classic
  };

  environment.systemPackages = with pkgs; [
    waybar
  ];
}
