{
  config,
  pkgs,
  ...
}: {
  imports = [
    <home-manager/nixos>
  ];

  # Install zsh
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.johannes = {
    isNormalUser = true;
    description = "Johannes";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    # packages = with pkgs; [
    # ];
  };

  home-manager.users.johannes = {pkgs, ...}: {
    home.stateVersion = "25.05";
    home.packages = with pkgs; [
      direnv
      htop-vim
    ];
  };
}
