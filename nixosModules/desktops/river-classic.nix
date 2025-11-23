{ pkgs, inputs, ... }:
{
  programs.river-classic = {
    enable = true; # enable river-classic
  };

  environment.systemPackages = with pkgs; [
    waybar
    rofi
    way-displays
    inputs.awww.packages.${pkgs.system}.awww
  ];
}
