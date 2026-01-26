{ config, lib, pkgs, ... }:
{
environment.systemPackages = [(
  pkgs.catppuccin-sddm.override {
    flavor = "mocha";
    accent = "mauve";
    font  = "Noto Sans";
    fontSize = "9";
    background = ./cartoon-castle.png;
    loginBackground = true;
  }
)];

  services.displayManager = {
    sddm = {
      enable = true;
      theme = "catppuccin-mocha-mauve";
      package = pkgs.kdePackages.sddm;

      wayland.enable = true;
      wayland.compositor = "weston";
    };
  };
}
