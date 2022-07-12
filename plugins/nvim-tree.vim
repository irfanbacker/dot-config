lua <<EOF
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
EOF

set termguicolors
set splitright
set cursorline
nnoremap <C-e> :NvimTreeFocus<CR>
