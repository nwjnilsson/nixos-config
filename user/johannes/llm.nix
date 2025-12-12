{
  config,
  pkgs,
  ...
}: {
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.johannes = {pkgs, ...}: {
    nixpkgs.config.allowUnfree = true;
    programs.claude-code = {
      enable = true;
      mcpServers = {
        nixos = {
          command = "uvx";
          args = ["mcp-nixos"];
        };
      };
    };
  };
}
