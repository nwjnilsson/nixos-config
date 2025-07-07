{
  config,
  pkgs,
  ...
}: {
  # for systems running in virtualbox
  environment.systemPackages = with pkgs; [
  ];
}
