require("nvim-tree").setup({
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    local dir = vim.fn.isdirectory(data.file) == 1
    if dir then
      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.open()
    end
  end
})
