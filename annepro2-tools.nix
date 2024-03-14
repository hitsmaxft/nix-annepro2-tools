{ pkgs, stdenv, fetchFromGitHub, autoPatchelfHook, system? builtins.currentSystem }:

let
  version = "28832f57501563a7d96befb20c83eab4b98a8eb9";
in
stdenv.mkDerivation {
  pname = "annepro2-tools";
  version = version;

  src = fetchFromGitHub {
    owner = "hitsmaxft";
    repo = "AnnePro2-Tools";
    rev = version;
    sha256="z+Ae0tuOBlKIYg56P9I27kI9MsDVdRnsvF4HEczLWqk=";
  };

  #nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = with pkgs ; [ pkgs.libusb1 pkgs.cargo pkgs.rustc pkgs.pkgconfig pkgs.cacert ] ++ lib.optional stdenv.isDarwin [ darwin.apple_sdk.frameworks.AppKi
t  libiconv];
  installPhase = ./annepro2-tools-install.sh;
  system = system;
}

