{
  description = "A set of tools to flash an annepro2 keyboard with custom firmware.";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flake-utils } :
  flake-utils.lib.eachDefaultSystem  (
    system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      annepro2tools = pkgs.callPackage ./. { };
    in
    {

      # pkgname.package.${system}.annepro2-tools
      packages.annepro2-tools = annepro2tools;

      # pkgname.defaultPackage.${system};
      defaultPackage = annepro2tools;

      devShells.default = pkgs.mkShell {
        buildInputs = [ annepro2tools ];
      };
    }
    );
  }
