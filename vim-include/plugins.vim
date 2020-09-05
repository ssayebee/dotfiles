" vundle
call plug#begin('~/.vim/plugged')

Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Session Manager
Plug 'mhinz/vim-startify'

" NerdTree
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'

" NerdTree Scrolling issue
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Comment
Plug 'scrooloose/nerdcommenter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'

" language packs
Plug 'sheerun/vim-polyglot'

" etc
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vimwiki/vimwiki'

" Track the engine.
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'kevinhwang91/rnvimr' 
Plug 'justinmk/vim-sneak'

call plug#end()
