{
  imports = [
   ./sddm.nix
   ./udisks2.nix
   ./xdg.nix
   ./bluetooth.nix
   ./power-management.nix
  ];

  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
  };

  services.ratbagd.enable = true;

  services.fwupd.enable = true;

  services.mpd.enable = true;
}
