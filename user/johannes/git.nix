{
  config,
  pkgs,
  ...
}: {
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.johannes = {pkgs, ...}: {
    programs = {
      git = {
        enable = true;
        userName = "Johannes Nilsson";
        userEmail = "nwj@themirelab.com";
        extraConfig = {
          init = { defaultBranch = "main"; };
          pull = { rebase = true; };
        };
      };
    };
  };
}
