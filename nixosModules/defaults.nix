{ lib, ... }:
{
  imports = [
    ./desktops/hyprland.nix
    ./desktops/caelestia.nix
    ./services/defaults.nix
    ./boot/grub2.nix
    ./programs/defaults.nix
    ./fonts.nix
  ];

}
