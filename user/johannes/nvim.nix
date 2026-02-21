{
  config,
  pkgs,
  ...
}: let
  # nixos-unstable
  pkgsUnstable = import <nixos-unstable> {
    system = pkgs.stdenv.hostPlatform.system;
    config = pkgs.config;
  };
in {
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.johannes = {
    pkgs,
    config,
    ...
  }: {
    programs = {
      neovim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;
        viAlias = true;

        extraPackages = with pkgs; [
          lua
          lua51Packages.luarocks
          lua-language-server
          bash-language-server
          yaml-language-server
          nil
          alejandra
          clang-tools
        ];

        plugins = with pkgs.vimPlugins; [
          (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-c
            p.tree-sitter-cpp
            p.tree-sitter-glsl
            p.tree-sitter-nix
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-vimdoc
            p.tree-sitter-python
            p.tree-sitter-json
            p.tree-sitter-markdown
            p.tree-sitter-markdown_inline
            p.tree-sitter-yaml
            p.tree-sitter-latex
          ]))
        ];
      };
    };

    home.file."${config.xdg.configHome}/nvim" = {
      source = builtins.path {
        path = ../../dotfiles/nvim;
        name = "nvim";
      };
      recursive = true;
    };
  };
}
