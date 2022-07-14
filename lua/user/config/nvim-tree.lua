require("nvim-tree").setup({
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
  }
})

-- COnfig
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.cursorline = true

-- Keybindings
vim.keymap.set("n", "<C-e>", "<CMD>NvimTreeFocus<CR>", { noremap = true })
