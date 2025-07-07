{ config, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ../../profiles/desktop.nix
      ../../user/johannes/user.nix
      ../../profiles/development.nix
    ];
}
