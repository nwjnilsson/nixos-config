{
  config,
  pkgs,
  ...
}: {
  imports = [
    <home-manager/nixos>
  ];

  # TODO: set up
  home-manager.users.johannes = {
    pkgs,
    config,
    ...
  }: {
    home.packages = with pkgs; [
    ];
  };
}
