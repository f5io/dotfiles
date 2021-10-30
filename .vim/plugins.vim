packadd minpac

call minpac#init()

" nerdtree stuff
call minpac#add('scrooloose/nerdtree')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('jistr/vim-nerdtree-tabs')

" fuzzy find
" ctrl-p - look for files
" ctrl-f - find in files
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')

" syntax
call minpac#add('stephpy/vim-yaml')
call minpac#add('rust-lang/rust.vim')
call minpac#add('pangloss/vim-javascript')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('maxmellon/vim-jsx-pretty')
call minpac#add('jparise/vim-graphql')
call minpac#add('leafOfTree/vim-svelte-plugin')

" utils
" ctrl+n - find next occurence
call minpac#add('terryma/vim-multiple-cursors')

" ysiw{ - etc
call minpac#add('tpope/vim-surround')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('neoclide/coc.nvim', {'branch':'release'})

" <enter> - context selection, repeat goes outwards
call minpac#add('gcmt/wildfire.vim')

" motion
" \w - word start
" \f{char} - character
call minpac#add('easymotion/vim-easymotion')

" alt-j - move line down
" alt-k - move line up
call minpac#add('matze/vim-move')
call minpac#add('christoomey/vim-tmux-navigator')

" colors
call minpac#add('f4814/vim-termscheme')

" status line
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

call minpac#add('k-takata/minpac', {'type':'opt'})

packloadall
