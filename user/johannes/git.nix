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
        extraConfig = {
          init = {defaultBranch = "main";};
          pull = {rebase = true;};
        };
      };
    };
  };
}
