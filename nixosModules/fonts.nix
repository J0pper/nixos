{ pkgs, ... }:
{
  # If changing from nixpkgs 24.11 (or earlier) to 25.05 (or later) see this:
  # https://nixos.wiki/wiki/Fonts #Installing only specific nerdfonts
  # fonts.packages = with pkgs; [
  #   # nerd-fonts
  #   nerd-fonts.hack
  #   nerd-fonts.jetbrains-mono
  #   nerd-fonts.symbols-only
  #   # (nerdfonts.override { fonts = [ "Hack" ]; })
  # ];
  fonts.packages = builtins.filter pkgs.lib.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
