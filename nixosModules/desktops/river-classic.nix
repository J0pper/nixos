{ pkgs, ... }:
{
  programs.river-classic = {
    enable = true; # enable river
  };

  environment.systemPackages = with pkgs; [
    waybar
  ];
}
