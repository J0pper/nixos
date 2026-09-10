{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rmpc
  ];
}
