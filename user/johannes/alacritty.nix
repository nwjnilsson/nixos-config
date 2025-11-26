{
  config,
  pkgs,
  ...
}: {
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.johannes = {pkgs, ...}: {
    home.stateVersion = "25.05";
    programs = {
      alacritty = {
        enable = true;
        theme = "tokyo_night";
        settings = {
          window = {
            opacity = 0.9;
            dimensions = {
              lines = 28;
              columns = 120;
            };
          };
          font = {
            size = 16;
            normal = {
              family = "CodeNewRoman Nerd Font Mono";
              style = "Regular";
            };
          };
        };
      };
    };
  };
}
