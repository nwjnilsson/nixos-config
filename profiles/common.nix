{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];

  programs.git.enable = true;

  environment.systemPackages = with pkgs; [
  ];
}
