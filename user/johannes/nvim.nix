{
  config,
  pkgs,
  ...
}: {
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.johannes = {
    pkgs,
    config,
    ...
  }: {
    home.packages = with pkgs; [
      direnv
    ];
    programs = {
      neovim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;
        viAlias = true;
        extraPackages = with pkgs; [
          # Packages always available in neovim. Other language servers are made
          # available through shell.nix files on a per-project basis.
          lua
          lua51Packages.luarocks
          lua-language-server
          bash-language-server
        ];
        #extraLuaPackages = ps: [
        #  ps.xxx
        #];
        plugins = with pkgs.vimPlugins; [
          telescope-nvim
          lualine-nvim
          kanagawa-nvim
          guess-indent-nvim
          harpoon
          vim-closer
          undotree
          vim-abolish
          vim-surround
          markview-nvim
          # lsp --------
          lsp-zero-nvim
          nvim-lspconfig
          nvim-cmp
          cmp-nvim-lsp
          luasnip
          mason-lspconfig-nvim
          # -----------
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
    home.file = {
      "${config.xdg.configHome}/nvim" = {
        source = builtins.path {
          path = ../../dotfiles/nvim;
          name = "nvim";
        };
        recursive = true;
      };
    };
  };
}
