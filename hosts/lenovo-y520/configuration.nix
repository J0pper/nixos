# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, zen-browser, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../disko-configs/lenovo-y520.nix
    ];


  networking.hostName = "lenovo-y520"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  # Enable bluetooth
  hardware.bluetooth.enable = true;

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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    pkgs.kitty
    pkgs.fastfetch
    pkgs.git
    pkgs.stow
    pkgs.starship
    pkgs.font-awesome
    pkgs.wofi
    pkgs.waybar
    pkgs.hyprpaper
    pkgs.hypridle
    pkgs.hyprlock
    pkgs.hyprshot
    inputs.zen-browser.packages."${pkgs.system}".default
    pkgs.tree
    pkgs.discord
    pkgs.catppuccin-sddm
    pkgs.unzip
    pkgs.nodejs_24
    pkgs.feh
  ];

  # If changing from nixpkgs 24.11 (or earlier) to 25.05 (or later) see this:
  # https://nixos.wiki/wiki/Fonts #Installing only specific nerdfonts
  fonts.packages = with pkgs; [
    nerd-fonts.hack
    # (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };


  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.firefox.enable = true;

  programs.zsh = {
    enable = true;
    zsh-autoenv.enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
};

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
