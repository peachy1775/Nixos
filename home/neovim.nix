{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (vimPlugins.catppuccin-nvim)
  ];

  programs.neovim = {
    enable = true;

    extraLuaConfig = ''
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          treesitter = true,
          telescope = true,
          cmp = true,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    '';
  };
}
