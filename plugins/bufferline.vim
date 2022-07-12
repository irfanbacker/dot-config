set termguicolors

lua <<EOF
require("bufferline").setup{
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or "" )
        s = s .. n .. sym
      end
      return s
    end,
    offsets = {
      {
          filetype = "NvimTree",
          text_align = "left",
      }
    },
  }
}
EOF

" Keybindings
nnoremap <silent>gt :BufferLineCycleNext<CR>
nnoremap <silent>gT :BufferLineCyclePrev<CR>
