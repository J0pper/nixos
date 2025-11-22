{ pkgs, lib, ... }:
{
  imports = [
  ./CAD/freecad.nix
  ./CAD/kicad.nix
  ./browsers/zen.nix
  ./chat/discord.nix
  ./chat/vesktop.nix
  ./music-players/spotify.nix
  ./shells/zsh.nix
  ./slicers/orca-slicer.nix
  ./slicers/prusa-slicer.nix
  ./system-monitoring/btop.nix
  ./terminals/kitty.nix
  ./text-editor/nvim.nix
  ./text-editor/obsidian.nix
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
  ];

  programs.nix-ld = {
    enable = true;
  };
}
