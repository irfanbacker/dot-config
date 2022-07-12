lua << EOF
  require("trouble").setup {}
EOF

" Keybindings
nnoremap tt <cmd>TroubleToggle<cr>
nnoremap tw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap td <cmd>TroubleToggle document_diagnostics<cr>
nnoremap tq <cmd>TroubleToggle quickfix<cr>
nnoremap tl <cmd>TroubleToggle loclist<cr>
nnoremap tr <cmd>TroubleToggle lsp_references<cr>
