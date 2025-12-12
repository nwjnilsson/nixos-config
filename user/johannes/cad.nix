{
  config,
  pkgs,
  ...
}: {
  imports = [
    <home-manager/nixos>
  ];

  # For prusa slicer
  # services.flatpak.enable = true;

  home-manager.users.johannes = {
    pkgs,
    config,
    ...
  }: {
    home.packages = with pkgs; [
      freecad
      librecad
      prusa-slicer
    ];
  };
}
