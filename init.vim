set nu
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
set clipboard=unnamedplus
set pastetoggle=<F3>
set hls
set showmatch
set cursorline
set noswapfile
set nobackup
set nowrap
set encoding=utf8
set colorcolumn=80
set mouse=r

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

" Plug 'francoiscabrol/ranger.vim' | Plug 'rbgrouleff/bclose.vim'
Plug 'kevinhwang91/rnvimr' 

call plug#end()

" Colorscheme config 
colorscheme onehalfdark
highlight ColorColumn ctermbg=gray
highlight Visual gui=reverse
highlight Pmenu guifg=#dcdfe4 guibg=#3a3e46

" use true tone color for theme
if exists('+termguicolors')
    set termguicolors
endif

" handle NERDTree Highlight Speed issue
let NERDTreeHighlightCursorline = 0

" windows의 clipboard 사용
let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end

let g:airline#extensions#tabline#enabled = 1

for include_file in uniq(sort(globpath(&rtp, 'vim-include/*.vim', 0, 1)))
    execute "source " . include_file
endfor
