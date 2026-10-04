{
  description = "my-project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        haskellPackages = pkgs.haskellPackages.override {
          overrides = hself: hsuper: {
            # Dependency overrides go here
          };
        };

        nixpkgsOverlay = _final: _prev: {
          my-project = self.packages.${system}.my-project;
        };
      in
      rec {
        packages.my-project = haskellPackages.callCabal2nix "my-project" ./. { };

        defaultPackage = packages.my-project;

        overlays = nixpkgsOverlay;

        devShell =
          pkgs.mkShell {
            buildInputs = with haskellPackages; [
              haskell-language-server
              ghcid
              cabal-install
            ];
            inputsFrom = [
              self.defaultPackage.${system}.env
            ];
          };
      }
    );
}
