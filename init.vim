set nu
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
set clipboard=unnamedplus
set t_Co=256
set pastetoggle=<F3>
set hls
set showmatch
set cursorline
" swap 파일 생성 제거
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

call plug#end()

" Colorscheme config 
colorscheme onehalfdark
highlight ColorColumn ctermbg=gray
highlight Visual gui=reverse

" use true tone color for theme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" NERDTree
map <leader>d :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$']

" Moving tab setting
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ctrlp config (ignore file)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']       " Ignore in .gitignore
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$|public$\|log$\|tmp$\|vendor$|node_modules$\|DS_Store$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" coc config
let g:coc_global_extensions = [
      \ 'coc-python',
      \ 'coc-clangd',
      \ 'coc-marketplace',
      \ 'coc-tsserver',
      \ 'coc-json',
      \ 'coc-pairs',
      \ 'coc-emmet',
      \ 'coc-tslint',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ ]

" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


let g:coc_filetype_map = {
      \ 'htmldjango': 'html',
      \ }

" indent guiles config
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 1
let g:indent_guides_auto_colors = 0

highlight IndentGuidesOdd  guibg=#474e5d
highlight IndentGuidesEven guibg=#575e6d

" Vimwiki Config
" 로컬 리더 키 설정은 취향이니 각자 마음에 드는 키로 설정한다
let maplocalleader = "\\"

"1번 위키(공개용)와 2번 위키(개인용)

let g:vimwiki_list = [
      \{
      \   'nested_syntaxes': {'java':'java', 'python': 'python', 'c++': 'cpp'},
      \   'path': '/home/ssayebee/wiki/_wiki',
      \   'ext' : '.md',
      \},
      \{
      \   'path': '/home/ssayebee/todo',
      \   'ext' : '.md',
      \   'diary_rel_path': '.',
      \},
      \]

" vimwiki의 conceallevel 을 끄는 쪽이 좋다
let g:vimwiki_conceallevel = 0
let g:vimwiki_table_mappings=0

" 자주 사용하는 vimwiki 명령어에 단축키를 취향대로 매핑해둔다
nmap <LocalLeader>ww <Plug>VimwikiIndex
nmap <LocalLeader>wi <Plug>VimwikiDiaryIndex
nmap <LocalLeader>w<LocalLeader>w <Plug>VimwikiMakeDiaryNote
nmap <LocalLeader>wt :VimwikiTable<CR>
nmap <Leader>t <Plug>VimwikiTabIndex

" F4 키를 누르면 커서가 놓인 단어를 위키에서 검색한다.
nnoremap <F4> :execute "VWS /" . expand("<cword>") . "/" <Bar> :lopen<CR>

" Shift F4 키를 누르면 현재 문서를 링크한 모든 문서를 검색한다
nnoremap <S-F4> :execute "VWB" <Bar> :lopen<CR>
" Vimwiki Config END

function! LastModified()
  if &modified
  " echo('markdown updated time modified')
    let save_cursor = getpos(".")
    let n = min([10, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}updated\s*: \).*#\1' .
          \ strftime('%Y-%m-%d %H:%M:%S +0900') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfunction

autocmd BufWritePre *.md call LastModified()

function! NewTemplate()

  let l:wiki_directory = v:false

  for wiki in g:vimwiki_list
    if expand('%:p:h') == wiki.path
      let l:wiki_directory = v:true
      break
    endif
  endfor

  if !l:wiki_directory
    return
  endif

  if line("$") > 1
    return
  endif

  let l:template = []
  call add(l:template, '---')
  call add(l:template, 'layout  : wiki')
  call add(l:template, 'title   : ')
  call add(l:template, 'summary : ')
  call add(l:template, 'date    : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
  call add(l:template, 'updated : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
  call add(l:template, 'tags    : ')
  call add(l:template, '---')
  call add(l:template, '')
  call setline(1, l:template)
  execute 'normal! gg2hA'
  echom 'new wiki page has created'
endfunction

augroup vimwikiauto
    autocmd BufWritePre *wiki/*.md keepjumps call LastModified()
    autocmd BufRead,BufNewFile *wiki/*.md call NewTemplate()
    autocmd FileType vimwiki inoremap <S-Right> <C-r>=vimwiki#tbl#kbd_tab()<CR>
    autocmd FileType vimwiki inoremap <S-Left> <Left><C-r>=vimwiki#tbl#kbd_shift_tab()<CR>
augroup END

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

nmap <leader>ot :!/mnt/c/Program\ Files/Typora/Typora.exe %<CR>
nmap <F8> :TagbarToggle<CR>
nmap <leader>ev :e ~/.config/nvim/init.vim<CR>
nmap <leader>es :UltiSnipsEdit<CR>
map <F7> :w <CR> :!clear && gcc -g % && ./a.out <CR>

highlight Pmenu guifg=#dcdfe4 guibg=#3a3e46

let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetDirectories = ['UltiSnips']

autocmd FileType vimwiki set shiftwidth=2 tabstop=2
