{ config, pkgs, ...}:

{
  imports =
    [
      <home-manager/nixos>
    ];

  home-manager.users.johannes = {pkgs, ...}: {
    home.stateVersion = "25.05";
    programs = {
      git = {
        enable = true;
        extraConfig = {
          init = { defaultBranch = "main"; };
          pull = { rebase = true; };
        };
      };
      thefuck.enable = true;
      zsh = {
        oh-my-zsh = {
          enable = true;
          plugins = [ "git" "thefuck" "z" "fzf" ];
          theme = "robbyrussell";
        };
      };
      neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
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
          # lsp --------
          lsp-zero-nvim
          nvim-lspconfig
          nvim-cmp
          cmp-nvim-lsp
          luasnip
          # -----------
          vim-nix
          nvim-treesitter.withPlugins(p: [
            p.tree-sitter-nix
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-vimdoc
            p.tree-sitter-python
            p.tree-sitter-json
            p.tree-sitter-c
            p.tree-sitter-cpp
            p.tree-sitter-glsl
          ];
        ];
      };
    };
    home.file = {
      ".config/nvim" = {
        source = ../../nvim-config;
        recursive = true;
      };
    };
  };
}
