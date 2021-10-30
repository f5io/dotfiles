" nerdtree settings
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_smart_startup_focus = 1
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_autoclose = 0
let g:nerdtree_tabs_synchronize_view = 1
let g:nerdtree_tabs_synchronize_focus = 0
let g:nerdtree_tabs_startup_cd = 1
let g:nerdtree_tabs_autofind = 1
let g:NERDTreeGitStatusShowIgnored = 1

" airline settings
let g:airline_theme = 'term'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1

" svelte settings
let g:vim_svelte_plugin_use_typescript = 1
let g:vim_svelte_plugin_has_init_indent = 1

" coc settings

let g:coc_global_extensions = [ 'coc-tsserver' ]
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>x  <Plug>(coc-format-selected)
nmap <leader>x  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Show autocomplete when Tab is pressed
"inoremap <silent><expr> <C-Tab> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ale settings
"let g:ale_disable_lsp = 1
"let g:ale_completion_enabled = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}
"let g:ale_linters = {'rust': ['analyzer']}
"let g:ale_rust_rls_executable = 'ra_lsp_server'
"let g:ale_rust_rls_toolchain = ''


" load those lovely plugins
so ~/.vim/plugins.vim

" shift+tab through buffers
map [Z :bnext<CR>

" ctrl+p - look for files
" ctrl+f - find in files
map  :Files<CR>
map  :Rg<CR>

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
set completeopt=menu,noinsert
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
set lazyredraw

set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c


set t_fs=
set t_ts=]1;

"set termguicolors
silent! colorscheme termscheme

filetype plugin indent on
syntax on
syntax sync minlines=256

highlight ALEWarning ctermbg=none cterm=underline ctermfg=Yellow
highlight ALEError ctermbg=none cterm=underline ctermfg=Red

highlight PmenuSel ctermbg=Yellow ctermfg=Black gui=bold
"highlight Pmenu ctermbg=Yellow ctermfg=0 gui=bold
highlight Pmenu ctermbg=Black gui=bold
