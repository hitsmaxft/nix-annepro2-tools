# Create the standard environment.
source $stdenv/setup

#fix `failed to open: /homeless-shelter/.cargo/.package-cache`
#cargo need $HOME writable
export HOME=$TEMPDIR 

cp -r $src/* ./
cargo build --release


# Create place to store the binaries.
mkdir -p $out/bin
# Copy the binary to the output binary directory.
cp ./target/release/annepro2_tools $out/bin/annepro2-tools
cp ./target/release/annepro2_tools $out/bin/annepro2_tools
# Allow execution of the binary.
chmod +x $out/bin/annepro2-tools
chmod +x $out/bin/annepro2_tools
