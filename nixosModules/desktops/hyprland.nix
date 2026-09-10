{ pkgs, ... }:
{
  imports = [
    ./caelestia.nix
  ];

  programs.hyprland = {
    enable = true; # enable hyprland
    xwayland.enable = true;
    withUWSM = true;
  };

  environment.systemPackages = with pkgs; [
    hyprpaper
    hypridle
    hyprlock
    hyprshot
  ];
}
