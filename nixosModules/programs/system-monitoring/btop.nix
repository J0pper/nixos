{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop-rocm
    btop-cuda
  ];
}
