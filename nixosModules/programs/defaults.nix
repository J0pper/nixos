{ pkgs, lib, ... }:
{
  imports = [
    ./CAD/freecad.nix
    ./browsers/zen.nix
  ./chat/discord.nix
  ./chat/vesktop.nix
  ./shells/zsh.nix
  ./slicers/orca-slicer.nix
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
    google-chrome
    piper
  ];
}
