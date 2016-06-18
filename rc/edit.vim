"--------------------------------------------------------------------------------
" edit.vim
"

" indents
set smarttab
set expandtab
set tabstop=2 softtabstop=2 shiftwidth=2
set shiftround
set autoindent smartindent

" enable modeline
set modeline

" use system clipboard
if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus
else
  set clipboard& clipboard+=unnamed
endif

" delete indent/newline with backspace
set backspace=indent,eol,start

" hightlight pairs
set showmatch
set cpoptions-=m
set matchtime=3

" display another buffer when current buffer isnt saved
set hidden

" autoload when file is changed by other programs
set autoread

" ignore case on completion
set infercase

" enable folding
set foldenable
set foldmethod=marker

" show folding level
set foldcolumn=3
set fillchars=vert:\|
set commentstring=%s

" timeout
set timeout timeoutlen=3000 ttimeoutlen=100

" CursorHold time
set updatetime=1000

" enable virtualedit in visual block mode
set virtualedit=block

" undofile
set undofile
let &undodir=&directory

if has('nvim')
  set viminfo=\"50,'100,<1000,h,s100,n~/.cache/.nviminfo
else
  set viminfo=\"50,'100,<1000,h,s100,n~/.cache/.viminfo
endif

if !has('gui_running')
  autocmd MyAutoCmd BufWritePost .vimrc nested source $MYVIMRC |
        \ echo "source $MYVIMRC"
else
  autocmd MyAutoCmd BufWritePost .vimrc nested source $MYVIMRC |
        \ if has('gui_running') | source $MYGVIMRC | echo "source $MYVIMRC"
  autocmd MyAutoCmd BufWritePost .gvimrc
        \ if has('gui_running') | source $MYGVIMRC | echo "source $MYGVIMRC"
endif

