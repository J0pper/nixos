{ lib, ... }:
{
  imports = [
    ./services/defaults.nix
    ./boot/grub2.nix
    ./programs/defaults.nix
    ./fonts.nix
  ];

}
