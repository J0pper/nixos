{
  lib,
  fetchFromCodeberg,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  name = "tinyrwm-rust";

  src = fetchFromCodeberg {
    owner = "river";
    repo = "tinyrwm";
    rev = "d1daddd8c9";
    hash = "sha256-MNzIohxFhva319q9qNU5nDnGjpY7eG/MLn4hg1u8bU0=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
    };
  };

  postPatch = ''
    ln -s ${./Cargo.lock} Cargo.lock
  '';
})
