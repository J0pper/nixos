{ pkgs, inputs, lib, ... }:
let
    argen = pkgs.callPackage ./WMs/argen.nix {};
#     river-argen = pkgs.river.overrideAttrs ( prev: { 
#         pname = "river-argen";
#
#         nativeBuildInputs = prev.nativeBuildInputs ++ (with pkgs; [
#            makeWrapper 
#         ]);
#
#         fixupPhase = (prev.fixupPhase or "") + ''
#             wrapProgram $out/bin/river \
#                 --prefix PATH : "/home/jeppe/.local/bin"
#         '';
#
#     });
in
{
  environment.systemPackages = with pkgs; [
    river
    argen
    wayland-utils
    way-displays
    waybar
    rofi
    kanshi
    inputs.awww.packages.${pkgs.system}.awww
  ];


    services.displayManager.sessionPackages = with pkgs; [
        river
    ];

    # Stolen from https://github.com/NixOS/nixpkgs/blob/37c151b84d028c5dd9dc653cbbae4b66ed8762b2/nixos/modules/programs/wayland/wayland-session.nix
    security = {
      polkit.enable = true;
      pam.services.swaylock = { };
    };

    programs = {
      dconf.enable = lib.mkDefault true;
      xwayland.enable = lib.mkDefault true;
    };

    services.graphical-desktop.enable = true;

    xdg.portal.wlr.enable = true;
    xdg.portal.extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];

    # Window manager only sessions (unlike DEs) don't handle XDG
    # autostart files, so force them to run the service
    services.xserver.desktopManager.runXdgAutostartIfNone = lib.mkDefault true;

    # Stolen from: https://github.com/nix-community/home-manager/blob/5d72a29fc36ac21adae6ae35568fe5ee6700850f/modules/services/window-managers/river.nix#L228-L236
    systemd.user.targets.river-session = {
      description = "river compositor session";
      documentation = [ "man:systemd.special(7)" ];
      bindsTo = [ "graphical-session.target" ];
      wants = [ "graphical-session-pre.target" ];
      after = [ "graphical-session-pre.target" ];
    };
}
