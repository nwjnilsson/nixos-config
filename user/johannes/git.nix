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
        settings = {
          init = {defaultBranch = "main";};
          pull = {rebase = true;};
          user = {
            name = "Johannes Nilsson";
            email = "nwj@themirelab.com";
          };
        };
      };
    };
  };
}
