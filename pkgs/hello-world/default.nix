{ stdenv, gcc, coreutils }:

stdenv.mkDerivation {
  name = "hello-world";

  # Source Code
  # See: https://nixos.org/nixpkgs/manual/#ssec-unpack-phase
  src = ./src;

  # Dependencies
  # See: https://nixos.org/nixpkgs/manual/#ssec-stdenv-dependencies
  buildInputs = [ coreutils gcc ];

  # Build Phases
  # See: https://nixos.org/nixpkgs/manual/#sec-stdenv-phases
  configurePhase = ''
    declare -xp
  '';
  buildPhase = ''
    gcc "$src/hello-world.c" -o ./hello-world
  '';
  installPhase = ''
    mkdir -p "$out/bin"
    cp ./hello-world "$out/bin/"
  '';
}
