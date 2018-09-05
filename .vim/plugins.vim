packadd minpac

call minpac#init()

" nerdtree stuff
call minpac#add('scrooloose/nerdtree')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('jistr/vim-nerdtree-tabs')

" fuzzy find
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')

" syntax
call minpac#add('sheerun/vim-polyglot')

" utils
call minpac#add('terryma/vim-multiple-cursors')
call minpac#add('tpope/vim-surround')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('w0rp/ale')

" motion
call minpac#add('easymotion/vim-easymotion')
call minpac#add('matze/vim-move')
call minpac#add('christoomey/vim-tmux-navigator')

" colors
call minpac#add('f4814/vim-termscheme')

" status line
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

call minpac#add('k-takata/minpac', {'type':'opt'})

packloadall
