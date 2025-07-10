{
  config,
  pkgs,
  ...
}: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../common.nix
    ../../user/johannes/default.nix
    ../../profiles/x11.nix # whenever i3 is used
    ../../profiles/desktop.nix
    ../../profiles/devtools.nix
  ];

  networking.hostName = "Neptune";
  # Uncomment to enable prettyfication of windows (more GPU intense,
  # not for things like Raspberry Pi)
  # home-manager.users.johannes.services.picom.backend = "glx";
}
