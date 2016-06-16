"--------------------------------------------------------------------------------
" dein.vim
"

let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

let s:path = expand('$CACHE/dein')
if !dein#load_state(s:path)
  finish
endif

let s:rcdir = fnamemodify(resolve(expand('<sfile>')), ':h')

call dein#begin(s:path, [expand('<sfile>')]
  \ + split(glob(s:rcdir . '/*.toml'), '\n'))

call dein#load_toml(s:rcdir . '/dein.toml', {'lazy': 0})
call dein#load_toml(s:rcdir . '/deinlazy.toml', {'lazy': 1})

call dein#end()
call dein#save_state()

if !has('vim_starting') && dein#check_install()
  call dein#install()
endif
