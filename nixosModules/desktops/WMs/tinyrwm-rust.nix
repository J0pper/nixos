{
  lib,
  fetchFromCodeberg,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "tinyrwm-rust";

  src = fetchFromCodeberg {
    owner = "river";
    repo = "tinyrwm";
    rev = "d1daddd8c9";
    hash = lib.fakeHash;
  }

  cargoHash = lib.fakeHash;
})
