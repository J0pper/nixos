{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    configPackages = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-wlr
    ];
  };
}
