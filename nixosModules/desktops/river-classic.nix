<<<<<<< HEAD
{ pkgs, inputs, ... }:
{
  programs.river-classic = {
    enable = true; # enable river-classic
  };

  environment.systemPackages = with pkgs; [
    wayland-utils
    way-displays
    waybar
    rofi
    kanshi
    inputs.awww.packages.${pkgs.system}.awww
  ];
}
