{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.git.enable = true;

  environment.systemPackages = with pkgs; [
  ];
}
