{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  libusb1,
  stdenv,
}:

rustPlatform.buildRustPackage rec {
  pname = "annepro2-tools";
  version = "0.1.1-unstable-2026-07-26";

  src = fetchFromGitHub {
    owner = "hitsmaxft";
    repo = "AnnePro2-Tools";
    rev = "3a0b4903012faa710d442140c3a84a92c7b284db";
    hash = "sha256-c9hN6VFjEoTYI7c4/dvSb4yg/ExZye371I8QxNthFBA=";
  };

  cargoLock.lockFile = ./Cargo.lock;

  nativeBuildInputs = [ pkg-config ];
  buildInputs = lib.optionals stdenv.isLinux [ libusb1 ];

  postInstall = ''
    mv "$out/bin/annepro2_tools" "$out/bin/annepro2-tools"
    ln -s annepro2-tools "$out/bin/annepro2_tools"
  '';

  meta = {
    description = "Firmware flashing tool for Anne Pro 2";
    homepage = "https://github.com/hitsmaxft/AnnePro2-Tools";
    license = lib.licenses.gpl2Only;
    platforms = lib.platforms.linux ++ lib.platforms.darwin;
    mainProgram = "annepro2-tools";
  };
}
