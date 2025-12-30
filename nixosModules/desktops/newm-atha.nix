{ config, pkgs, inputs, ... }:

{
  # nixpkgs.overlays = [
  #   (final: prev: {
  #     newm-next = prev.python3Packages.buildPythonApplication rec {
  #       pname = "newm-next";
  #       inherit (inputs.newm-next.packages.${pkgs.system}.newm-next) version src;
  #
  #       # Fix for newer nixpkgs Python rules
  #       pyproject = true;
  #       build-system = [ prev.python3Packages.setuptools ];
  #
  #       propagatedBuildInputs =
  #         inputs.newm-next.packages.${pkgs.system}.newm-next.propagatedBuildInputs;
  #
  #       doCheck = false;
  #     };
  #   })
  # ];

  environment.systemPackages = [
    pkgs.alacritty
    inputs.newm-next.packages.${pkgs.system}.newm-next
  ];
}

