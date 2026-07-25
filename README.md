# nix-annepro2-tools

A Nix package and flake for
[`hitsmaxft/AnnePro2-Tools`](https://github.com/hitsmaxft/AnnePro2-Tools).
It supports Linux and macOS on x86_64 and aarch64.

```sh
nix run github:hitsmaxft/nix-annepro2-tools -- --help
nix run github:hitsmaxft/nix-annepro2-tools -- --probe
```

The package installs both `annepro2-tools` and the compatibility alias
`annepro2_tools`. The pinned source includes device-reported IAP addresses,
strict response/status validation, timeouts, a read-only probe, and tested BLE
flashing.
