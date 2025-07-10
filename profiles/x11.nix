{
  config,
  lib,
  pkgs,
  ...
}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,se";
    variant = "";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # TODO: move to machine config
  # services.xserver.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    xclip
  ];
}
