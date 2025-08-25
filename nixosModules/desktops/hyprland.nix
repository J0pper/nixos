{ pkgs, inputs, ... }:
{
  programs.hyprland = {
    enable = true; # enable hyprland
    xwayland.enable = true;
    withUWSM = true;
  };
}
