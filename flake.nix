{
  description = "Firmware flashing tool for Anne Pro 2. Allows custom firmware download.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      pkgsFor = nixpkgs.legacyPackages;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = pkgsFor.${system};
        in
        rec {
          annepro2_tools = pkgs.callPackage ./. { };
          default = annepro2_tools;
        });
    };
}
