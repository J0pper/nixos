{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/release-24.05";

    hyprland.url = "github:hyprwm/Hyprland";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    caelestia-cli = {
      url = "github:caelestia-dots/cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, disko, ... } @inputs:
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
          ./nixosModules/programs/freecad.nix
        ];
      };
      # work = nixpkgs.lib.nixosSystem

      lenovo-y520 = nixpkgs.lib.nixosSystem {
        specialArgs = { 
          inherit inputs;
        };
        modules = [
          ./hosts/lenovo-y520/configuration.nix
          disko.nixosModules.disko
          ./nixosModules/boot-disko/grub2.nix
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
  };
}
