{
  config,
  pkgs,
  ...
}: {
# for systems running in virtualbox
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.clipboard = true;
  environment.systemPackages = with pkgs; [
  ];
}
