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
call minpac#add('sheerun/vim-polyglot')

" utils
" ctrl+n - find next occurence
call minpac#add('terryma/vim-multiple-cursors')

" ysiw{ - etc
call minpac#add('tpope/vim-surround')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('w0rp/ale')

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
