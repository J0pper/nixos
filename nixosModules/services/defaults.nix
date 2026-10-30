{
  imports = [
   ./sddm.nix
   ./udisks2.nix
   ./xdg.nix
   ./bluetooth.nix
   ./pipewire.nix
   ./power-management.nix
  ];

  services.ratbagd.enable = true;

  services.fwupd.enable = true;

  services.mpd.enable = true;

  services.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
      tapping = true;
      tappingDragLock = true;
    };
  };
}
