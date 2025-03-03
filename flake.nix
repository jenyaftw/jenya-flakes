{
  description = "Jenya's Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      # Import our custom opencomposite package
      packages = forAllSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
          opencomposite = pkgs.callPackage ./pkgs/opencomposite/default.nix {
            opencomposite = pkgs.opencomposite; # pass original package
          };
          hello-world = pkgs.callPackage ./pkgs/hello-world/default.nix { };
        in
        {
          inherit opencomposite hello-world;
          default = opencomposite;
        }
      );

    };
}
