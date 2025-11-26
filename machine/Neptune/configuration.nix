{
  config,
  pkgs,
  ...
}: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../common.nix
    ../../user/johannes/default.nix
    ../../user/johannes/3d_printing_tools.nix
    ../../profiles/x11.nix # whenever i3 is used
    ../../profiles/desktop.nix
    ../../profiles/devtools.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot = {
    enable = true;
    consoleMode = "auto";
  };
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "/dev/sdb";
  # boot.loader.grub.useOSProber = true;


  networking.hostName = "Neptune";
  # Uncomment to enable prettyfication of windows (more GPU intense,
  # not for things like Raspberry Pi)
  home-manager.users.johannes.services.picom.backend = "glx";

  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
