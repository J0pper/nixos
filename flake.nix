{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/release-24.05";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @inputs:
  let
    system = "x86_64-linux";
  in 
  {
    nixosConfigurations = {
      personal = nixpkgs.lib.nixosSystem {
        specialArgs = { 
          inherit inputs;
        };
        modules = [
          ./hosts/personal/configuration.nix
          ./nixosModules/boot/grub2.nix
          ./nixosModules/desktops/hyprland.nix
          ./nixosModules/services/xdg.nix
          ./nixosModules/services/sddm.nix
        ];
      };
      # work = nixpkgs.lib.nixosSystem

      lenovo-y520 = nixpkgs.lib.nixosSystem {
        specialArgs = { 
          inherit inputs;
        };
        modules = [
          ./hosts/lenovo-y520/configuration.nix
          ./nixosModules/boot/grub2.nix
          inputs.disko.nixosModules.disko
          ./nixosModules/desktops/hyprland.nix
          ./nixosModules/services/xdg.nix
          ./nixosModules/services/sddm.nix
        ];
      };

      tv-media-box = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/tv-media-box/configuration.nix
          ./nixosModules/boot/grub2.nix
          ./disko-configs/tv-media-box.nix
          #inputs.disko.nixosModules.disko
        ];
    };
  };
}
