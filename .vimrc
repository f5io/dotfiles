" nerdtree settings
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_smart_startup_focus = 1
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_autoclose = 0
let g:nerdtree_tabs_synchronize_view = 1
let g:nerdtree_tabs_synchronize_focus = 0
let g:nerdtree_tabs_startup_cd = 1
let g:nerdtree_tabs_autofind = 1
let g:NERDTreeShowIgnoredStatus = 1

" airline settings
let g:airline_theme = 'term'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" load those lovely plugins
so ~/.vim/plugins.vim

" shift+tab through buffers
map [Z :bnext<CR>

" ctrl+p - look for files
" ctrl+f - find in files
map  :Files<CR>
map  :Ag<CR>

" alt+j move selection/line up
" alt+k move selection/line down
set <F20>=j
set <F21>=k

" move commands for normal mode
nmap <F21> <Plug>MoveLineUp
nmap <F20> <Plug>MoveLineDown

" move commands for visual mode
vmap <F21> <Plug>MoveBlockUp
vmap <F20> <Plug>MoveBlockDown

nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Easy Motion
map <Leader> <Plug>(easymotion-prefix)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" disable arrows in normal mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Disable Arrow keys in Insert mode
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

set ttimeoutlen=0
set nocursorcolumn
set nocursorline
set norelativenumber
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set hidden
set number
set noswapfile
set nowrap
set backspace=indent,eol,start

set t_ts=]1;
set t_fs=

"set termguicolors
silent! colorscheme termscheme

filetype plugin indent on
syntax on
syntax sync minlines=256


