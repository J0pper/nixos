{
  imports = [
   ./sddm.nix
   ./udisks2.nix
   ./xdg.nix
   ./bluetooth.nix
  ];

  services.ratbagd.enable = true;

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
}
