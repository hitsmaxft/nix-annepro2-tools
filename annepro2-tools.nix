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
    sha256="Oy5acTuE0Oz5CdFXDkwFrtoHEFC3B/lQR/4kjlqcibE=";
  };

  #nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [ pkgs.libusb1 pkgs.cargo pkgs.rustc pkgs.pkgconfig pkgs.cacert ];

  installPhase = ./annepro2-tools-install.sh;
  system = system;
}

