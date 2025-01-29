# annepro2-tools flake package

A nix flake to run annepro2-tools 

fordevshell, Simply run
```shell
nix shell github:hitsmaxft/nix-annepro2-tools/master
```

* optional `--no-sandbox` is required to download cargo packages for building.

run annepro2-tools direct
```nix run github:hitsmaxft/nix-annepro2-tools annepro2-tools -- --help```


## use in direnv

append flake command to your .envrc

```.envrc

use flake github:hitsmaxft/nix-annepro2-tools/master
```
