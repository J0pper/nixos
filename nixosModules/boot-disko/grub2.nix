{ pkgs, ... }:
{
  imports = [
    ./grub2-theme.nix
  ];

  boot.loader = {
    efi = {
      # canTouchEfiVariables = true;
    };

    grub = {
      enable = true;
      # devices = [ "nodev" ];
      efiSupport = true;
      # useOSProber = true;
      efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
    };
  };
}
