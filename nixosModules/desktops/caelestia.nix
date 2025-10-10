{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.caelestia-cli.packages."${pkgs.system}".with-shell
    pavucontrol
  ];
}
