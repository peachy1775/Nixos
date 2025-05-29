{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      telescope-nvim
      plenary-nvim
      nvim-cmp
      cmp-nvim-lsp
      nvim-treesitter
      nvim-tree-lua
      lualine-nvim
      toggleterm-nvim
      nvim-lspconfig
      mason-nvim
      mason-lspconfig-nvim
      nvim-autopairs
      harpoon
      nvim-surround
      vim-illuminate
    ];

    # extraLuaConfig removed — config lives in Lua files instead
  };
}
