# annepro2-tools flake package

A nix flake to run annepro2-tools 

Simply run
```nix shell github:hitsmaxft/nix-annepro2-tools --no-sandbox```

`--no-sandbox` is required to download cargo packages for building.

Run using `annepro2_tools`.


run annepro2-tools direct
```nix run github:hitsmaxft/nix-annepro2-tools annepro2_tools -- --help```
