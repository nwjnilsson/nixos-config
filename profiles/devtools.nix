{
  config,
  pkgs,
  ...
}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  hardware.saleae-logic.enable = true; # enables udev rule

  services.udev.packages = with pkgs; [
    platformio-core.udev
  ];
  environment.systemPackages = with pkgs; [
    platformio
    saleae-logic-2
    gdb
    gdbgui
  ];
}
