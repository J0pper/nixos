{ pkgs, lib, ... }:
{
  imports = [
  ./CAD/freecad.nix
  ./CAD/openscad.nix
  # ./CAD/kicad.nix
  ./browsers/zen.nix
  ./browsers/chrome.nix
  ./browsers/zen.nix
  ./browsers/tor.nix
  ./chat/discord.nix
  ./chat/vesktop.nix
  ./music-players/spotify.nix
  ./shells/zsh.nix
  ./slicers/prusa-slicer.nix
  ./system-monitoring/btop.nix
  ./terminals/kitty.nix
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
    zip
    unzip
    feh
    piper
    playerctl
    ripgrep
    obs-studio
    kdePackages.dolphin
    printrun
    pamixer
    shotman
    grim
    libreoffice-qt-fresh
    postman
    nodejs_26
    jless
    prismlauncher
    cargo
    rustc
    rustup
    fstl
    jq
    wireguard-tools
    fzf
    pavucontrol
    python315
    wdisplays
    wlr-randr
    powertop
    brightnessctl
    slurp
    bun
    # auto-cpufreq
    godotPackages_4_3.godot
    ani-cli
    qbittorrent-enhanced
    pwvucontrol
    wireplumber
    stoat-desktop
    ffmpeg
    speedcrunch
    qalculate-qt
    mdbook
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

  programs.steam.enable = true;
  programs.openvpn3.enable = true;
}

