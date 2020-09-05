" ctrlp config (ignore file)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']       " Ignore in .gitignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

