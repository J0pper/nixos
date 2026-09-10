with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "argen";

    src = fetchFromCodeberg {
        owner = "pkap";
        repo = "argen";
    };
    #
    # nativeBuildInputs = [
    #
    #
    # ];
    #
    # buildInputs = [
    #
    # ];

}
