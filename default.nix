{ pkgs, stdenv, lib, fetchFromGitHub, }:

stdenv.mkDerivation rec {
  pname = "annepro2-tools";
  version = "28832f57501563a7d96befb20c83eab4b98a8eb9";

  src = fetchFromGitHub {
    owner = "hitsmaxft";
    repo = "AnnePro2-Tools";
    rev = version;
    sha256="z+Ae0tuOBlKIYg56P9I27kI9MsDVdRnsvF4HEczLWqk=";
  };

  buildInputs = with pkgs ; [ pkgs.libusb1 pkgs.cargo pkgs.rustc pkgs.pkg-config pkgs.cacert ] ++ lib.optional stdenv.isDarwin [ darwin.apple_sdk.frameworks.AppKit  libiconv];

  installPhase = ''
    # Create the standard environment.
    source $stdenv/setup

    #fix `failed to open: /homeless-shelter/.cargo/.package-cache`
    #cargo need $HOME writable
    export HOME=$TEMPDIR

    mkdir -p $HOME/.cargo
    cat << EOF | tee -a $HOME/.cargo/config.toml
[source.crates-io]
replace-with = 'ustc'

[source.ustc]
registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/"
EOF
    cp -r $src/* ./
    cargo build --release

    # Create place to store the binaries.
    mkdir -p $out/bin
    # Copy the binary to the output binary directory.
    cp ./target/release/annepro2_tools $out/bin/annepro2-tools
    # Allow execution of the binary.
    chmod +x $out/bin/annepro2-tools
  '';
  system = builtins.currentSystem;
}

