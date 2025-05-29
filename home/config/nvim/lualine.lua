local custom_lualine = {
  normal = {
    a = { fg = "#1e1e2e", bg = "#89b4fa", gui = "bold" },
    b = { fg = "#cdd6f4", bg = "#313244" },
    c = { fg = "#cdd6f4", bg = "#1e1e2e" },
  },
  insert = {
    a = { fg = "#1e1e2e", bg = "#94e2d5", gui = "bold" },
  },
  visual = {
    a = { fg = "#1e1e2e", bg = "#f5c2e7", gui = "bold" },
  },
  replace = {
    a = { fg = "#1e1e2e", bg = "#f38ba8", gui = "bold" },
  },
  command = {
    a = { fg = "#1e1e2e", bg = "#fab387", gui = "bold" },
  },
  inactive = {
    a = { fg = "#cdd6f4", bg = "#1e1e2e" },
    b = { fg = "#cdd6f4", bg = "#1e1e2e" },
    c = { fg = "#cdd6f4", bg = "#1e1e2e" },
  },
}

require("lualine").setup({
  options = {
    theme = custom_lualine,
    icons_enabled = true,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = { "NvimTree", "toggleterm" },
  },
  sections = {
    lualine_a = { { 'mode', icon = '' } },
    lualine_b = {
      { 'branch', icon = '' },
      'diff',
      {
        'diagnostics',
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        colored = true,
      },
    },
    lualine_c = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = ' ●',
          readonly = ' ',
          unnamed = '[No Name]',
        },
        color = { fg = "#cdd6f4", gui = "bold" },
      },
    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { { 'progress', icon = '' } },
    lualine_z = { { 'location', icon = '' } },
  },
  extensions = { 'nvim-tree', 'toggleterm' },
})
