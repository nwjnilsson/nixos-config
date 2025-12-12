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
      pay-respects = {
        enable = true;
        enableZshIntegration = true;
      };
      fzf.enable = true;
      zsh = {
        enable = true;
        oh-my-zsh = {
          enable = true;
          plugins = ["git" "z" "fzf"];
          theme = "robbyrussell";
        };
        initContent = ''
          eval "$(direnv hook zsh)"
        '';
      };
    };
  };
}
