require("catppuccin").setup({
  flavour = "mocha",
  integrations = {
    treesitter = true,
    telescope = true,
    cmp = true,
  },
})
vim.cmd.colorscheme("catppuccin")
