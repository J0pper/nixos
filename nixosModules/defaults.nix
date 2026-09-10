{ lib, ... }:
{
  imports = [
    ./desktops/river.nix
    ./services/defaults.nix
    ./boot/grub2.nix
    ./programs/defaults.nix
    ./fonts.nix
  ];
  hardware.enableAllFirmware = true;
}
