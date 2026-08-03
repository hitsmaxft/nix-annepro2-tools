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
    rev = "c6715d574b539fffbbba0e77914196651cd631a4";
    hash = "sha256-5prX/HU4ort3qiBPUe/L7Vn/DYR6JCS/fHcph12DpAI=";
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
