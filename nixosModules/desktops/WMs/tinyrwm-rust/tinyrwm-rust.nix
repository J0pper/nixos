{
  lib,
  fetchFromCodeberg,
  rustPlatform,
}:

rustPlatform.buildRustPackage rec {
  pname = "tinyrwm-rust";
  version = "0.1.0";

  src = "${fetchFromCodeberg {
    owner = "river";
    repo = "tinyrwm";
    rev = "v${version}";
    hash = "sha256-MNzIohxFhva319q9qNU5nDnGjpY7eG/MLn4hg1u8bU0=";
  }}/rust/";

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  postPatch = ''
    ln -s ${./Cargo.lock} Cargo.lock
  '';
}
