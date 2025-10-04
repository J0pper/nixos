{ pkgs, ... }:
{
  # If changing from nixpkgs 24.11 (or earlier) to 25.05 (or later) see this:
  # https://nixos.wiki/wiki/Fonts #Installing only specific nerdfonts
  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    # (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}
