{
  imports = [
   ./sddm.nix
   ./udisks2.nix
   ./xdg.nix
   ./bluetooth.nix
   ./pipewire.nix
  ];

  services.ratbagd.enable = true;
}
