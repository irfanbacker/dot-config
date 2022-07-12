set number
set autoindent
set smarttab
set mouse=a
syntax on

" 2 space tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

source ~/.config/nvim/plugins.vim

" Theme
" colorscheme github_dark_default

" let g:tokyonight_style = "night"
" colorscheme tokyonight

let g:onedark_config = { 'style': 'darker' }
colorscheme onedark

" Global custom keybindings
source ~/.config/nvim/keybindings.vim

" Configs
source ~/.config/nvim/config/tab-delete.vim
