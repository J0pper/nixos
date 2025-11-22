{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.newm-atha.packages."${pkgs.system}".new-atha
  ];
}
