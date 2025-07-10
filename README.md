# NixOS config files
This repo contains my NixOS configuration. The idea is to create a machine-
specific config `machine/machine-name/configuration.nix` and symlink this to
`/etc/nixos/configuration.nix`. Packages are mostly managed with home-manager
(`user/`). Packages that are appropriate to install system-wide are usually
found in `profiles/`. Development environments are managed with `shell.nix`
files in the corresponding project, which keeps the package lists here minimal.
