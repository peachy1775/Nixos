local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true })

vim.keymap.set("i", "<C-l>", function()
  local col = vim.fn.col(".")
  local char = vim.fn.getline("."):sub(col, col)
  if vim.tbl_contains({ ")", "]", "}", '"', "'", "`" }, char) then
    return "<Right>"
  else
    return "<C-l>"
  end
end, { expr = true, noremap = true })

vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
