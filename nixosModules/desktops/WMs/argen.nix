{
  # stdenv,
  # fetchFromCodeberg,
  # zig_0_16,
  lib,
  stdenv,
  fetchFromCodeberg,
  libevdev,
  libxkbcommon,
  pixman,
  pkg-config,
  scdoc,
  wayland,
  wayland-protocols,
  wayland-scanner,
  zig_0_16,
  fcft,
}:
let
  zig = zig_0_16;
in
stdenv.mkDerivation (finalAttrs: {
  pname = "argen";
  name = "argen";
  version = "0.1.2";

  src = fetchFromCodeberg {
    owner = "pkap";
    repo = "argen";
    rev = "4910a2e7d7e113e15321d027e4ea7abf5420ba3e";
    hash = "sha256-XppoYhV0ntXmTa68nIwa2XLq8Zsi5tzIVL9Z00DXlNU=";
  };

  strictDeps = true;

  zigDeps = zig.fetchDeps {
    inherit (finalAttrs) src pname version;
    fetchAll = true;
    hash = "sha256-VzLbjJqqiY5M3TYrN0kUOgoD73tnTD960cj+V3Vjj1o=";
  };

  postConfigure = ''
    ln -s ${finalAttrs.zigDeps} "$ZIG_GLOBAL_CACHE_DIR/p"
  '';

  nativeBuildInputs = [
    pkg-config
    zig
    wayland-scanner
    wayland-protocols
    scdoc
    libevdev
  ];

  buildInputs = [
    wayland
    libevdev
    libxkbcommon
    wayland-scanner
    wayland-protocols
    pixman
    fcft
  ];
})
