{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";

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

    awww = {
      url = "git+https://codeberg.org/LGFae/awww";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # newm-atha.url = "sourcehut:~atha/newm-atha";
    # newm-atha.inputs.nixpkgs.follows = "nixpkgs";
    # newm-next = {
    #   url = "github:newm-next/newm-next";
    #   inputs.nixpkgs.follows = "nixpkgs-older";
    #   # inputs.nixpkgs.follows = "nixpkgs";
    # };

    # nixpkgs-older.url = "github:nixos/nixpkgs/3e313808bd2e0a0669430787fb22e43b2f4bf8bf";
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
          ./nixosModules/defaults.nix
          ./nixosModules/desktops/river-classic.nix
          # ./nixosModules/desktops/newm-atha.nix
          ./nixosModules/virtualization.nix
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
