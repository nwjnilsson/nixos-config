{ config, pkgs, ...}:

{
  imports =
    [
      <home-manager/nixos>
    ];

  home-manager.users.johannes = {pkgs, ...}: {
    home.stateVersion = "25.05";
    programs = {
      wezterm = {
        enable = true;
        enableZshIntegration = true;
      };
      git = {
        enable = true;
        extraConfig = {
          init = { defaultBranch = "main"; };
          pull = { rebase = true; };
        };
      };
      thefuck.enable = true;
      fzf.enable = true;
      zsh = {
        enable = true;
        oh-my-zsh = {
          enable = true;
          plugins = [ "git" "thefuck" "z" "fzf" ];
          theme = "robbyrussell";
        };
        initContent = ''
          eval "$(direnv hook zsh)"
        '';
      };
      neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        extraPackages = with pkgs; [
          lua
          lua-language-server
          nil
          yaml-language-server
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
          # lsp --------
          lsp-zero-nvim
          nvim-lspconfig
          nvim-cmp
          cmp-nvim-lsp
          luasnip
          mason-lspconfig-nvim
          # -----------
          vim-nix
          (nvim-treesitter.withPlugins(p: [
            p.tree-sitter-nix
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-vimdoc
            p.tree-sitter-python
            p.tree-sitter-json
            p.tree-sitter-c
            p.tree-sitter-cpp
            p.tree-sitter-glsl
          ]))
        ];
      };
    };
    home.file = {
      ".config/nvim" = {
        source = builtins.path {
          path = ../../dotfiles/nvim-config;
          name = "nvim-config";
        };
        recursive = true;
      };
    };
    home.file = {
      ".config/wezterm" = {
        source = builtins.path {
          path = ../../dotfiles/wezterm;
          name = "wezterm";
        };
        recursive = true;
      };
    };
    home.packages = with pkgs; [
      direnv
    ];
  };
}
