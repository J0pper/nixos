# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, zen-browser, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #../../disko-configs/lenovo-y520.nix
    ];


  networking.hostName = "lenovo-y520"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };
  services.blueman.enable = true;

  security.polkit.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_DK.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "dk";
    variant = "";
  };


  # Configure console keymap
  console.keyMap = "dk-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jeppe = {
    isNormalUser = true;
    description = "Jeppe Vad Andersen";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  nix.settings.experimental-features = [ "nix-command flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.firefox.enable = true;


  # hardware.graphics = {
  #   enable = true;
  #   enable32Bit = true;
  # };
  #
  # services.xserver.videoDrivers = [ "nvidia" "modesetting" ];
  #
  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   powerManagement.enable = true;
  #   open = false;
  #
  #   prime = {
  #     nvidiaBusId = "PCI:1:0:0";
  #     intelBusId = "PCI:0:2:0";
  #   };
  #
  # };
  #

  # hardware.graphics = {
  #   enable = true;
  #   enable32Bit = true;
  # };
  #
  # services.xserver.videoDrivers = [ "nvidia" "modesetting" ];
  #
  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   powerManagement.enable = true;
  #   open = false;
  #
  #   prime = {
  #     nvidiaBusId = "PCI:1:0:0";
  #     intelBusId = "PCI:0:2:0";
  #   };
  #
  # };



  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
