{ pkgs, inputs, ... }:
{
  programs.river-classic = {
    enable = true; # enable river
  };

  environment.systemPackages = with pkgs; [
    wayland-utils
    way-displays
    wlr-randr
    waybar
    rofi
    kanshi
    inputs.awww.packages.${pkgs.system}.awww
  ];
}
