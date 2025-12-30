{ pkgs, lib, ... }:
{
  imports = [
  ./CAD/freecad.nix
  ./CAD/kicad.nix
  ./browsers/zen.nix
  ./chat/discord.nix
  ./chat/vesktop.nix
  ./shells/zsh.nix
  ./slicers/prusa-slicer.nix
  ./system-monitoring/btop.nix
  ./terminals/foot.nix
  ./text-editor/nvim.nix
  ./text-editor/obsidian.nix
  ./music-players/spotify.nix
  ];

  environment.systemPackages = with pkgs; [
    fastfetch
    git
    stow
    starship
    font-awesome
    tree
    catppuccin-sddm
    unzip
    feh
    piper
    btop
    powertop
  ];

  programs.nix-ld = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/jeppe/nixos"; # sets NH_OS_FLAKE variable for you
  };
}
