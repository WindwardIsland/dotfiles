"                          _____            
" _____________________   ____(_)______ ___ 
" __  __ \  _ \  __ \_ | / /_  /__  __ `__ \
" _  / / /  __/ /_/ /_ |/ /_  / _  / / / / /
" /_/ /_/\___/\____/_____/ /_/  /_/ /_/ /_/ 
"
" My init.vim file where my neovim configurations and plugins are stored.

" Basic settings
:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set mouse=a
:set foldmethod=manual
:set nohlsearch
:set cursorline
:set noswapfile
:set noshowmode
:set conceallevel=1
:set wrap

" Neovim plugins
call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/Raimondi/delimitMate'
Plug 'https://github.com/preservim/vim-markdown'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/sainnhe/everforest'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'https://github.com/lambdalisue/vim-suda'

call plug#end()

" NERDTree Keybindings and Settings
nnoremap <C-o> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Keybindings for tabs
nnoremap <C-h> :tabp<cr>
nnoremap <C-l> :tabn<cr>
nnoremap <C-n> :tabnew<cr>
nnoremap <C-x> :tabc<cr>

" Neovim colorscheme
syntax on
let g:onedark_termcolors=8
colorscheme onedark
let g:airline_theme = 'onedark'
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

" Sudaedit plugin to read and write files that are root-protected
let g:suda_smart_edit = 1
