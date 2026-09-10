{ pkgs, lib, ... }:
{
  imports = [
  ./CAD/freecad.nix
  ./CAD/openscad.nix
  ./browsers/zen.nix
  ./browsers/tor.nix
  ./chat/discord.nix
  ./chat/vesktop.nix
  ./shells/zsh.nix
  ./slicers/prusa-slicer.nix
  ./system-monitoring/btop.nix
  ./terminals/foot.nix
  ./text-editor/nvim.nix
  ./text-editor/obsidian.nix
  ./music-players/spotify.nix
  ./music-players/rmpc.nix
  ];

  environment.systemPackages = with pkgs; [
    fastfetch
    git
    stow
    starship
    font-awesome
    tree
    catppuccin-sddm
    unzip
    feh
    piper
    powertop
    brightnessctl
    shotman
    slurp
    printrun
    bun
    # auto-cpufreq
    nodejs_26
    godotPackages_4_3.godot
    ani-cli
    qbittorrent-enhanced
    cargo
    pwvucontrol
    wireplumber
    ripgrep
    stoat-desktop
    ffmpeg
    jq
    postman
    jless
    playerctl
    speedcrunch
    qalculate-qt
    libreoffice
    python315
    mdbook
    fstl
    prismlauncher
    docker
    docker-compose
    postgresql
  ];

  programs.nix-ld = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/jeppe/nixos"; # sets NH_OS_FLAKE variable for you
  };

  # programs.steam.enable = true;

}
