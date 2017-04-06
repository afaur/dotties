" Leader
let mapleader = " "

" LocalLeader
let maplocalleader = "\\"

syntax on
colorscheme jellybeans

highlight Normal guibg=black guifg=white

au BufRead,BufNewFile *.es6 setfiletype javascript

set clipboard+=unnamedplus,unnamed,autoselect
set nowrap
set synmaxcol=200         " Limit syntax highlighting to lines under 200 chars
set background=dark
set backspace=2           " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set incsearch         " do incremental searching
set laststatus=2      " Always display the status line
set autowrite         " Automatically :write before running commands
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" --ignore ".*gitkeep" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Resize windows when you resize vim
autocmd VimResized * :wincmd =

" Disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" Work specific mega repos
if (match(system("pwd"), "rpm_site") != -1)
  let g:ctrlp_use_caching = 1
endif

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" ESLint
let g:syntastic_javascript_checkers = ['eslint']

" Mouse support
set mouse=a

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Save and close a file without quitting vim
nnoremap <leader>w :w<bar>bd<CR>

" Save the current file when accidently stuck in readonly mode
nnoremap <leader>W :w ! sudo tee %<CR>

" Reload vimrc
nnoremap <C-U> :source $MYVIMRC<CR>

" Default tab settings
nnoremap <C-T> :set ts=2 sts=2 sw=2 expandtab smarttab<CR>

" CSS selectors
nnoremap <C-S> :'<,'>s:  .*:& !important:g

" If not in macvim
if has("gui_macvim") == 0
  " Building vim w/ +clientserver and +clipboard
  " may not work properly with your mac
  " (ensure xquartz installed and pasteboard settings are set)
  if has('clientserver')
    " Define an alternate method for copy and paste
    vnoremap <C-c> :w !pbcopy<CR><CR>
    noremap <C-v> :r !pbpaste<CR><CR>
    " Hack to override y and Y with pipe to system clip
    " Does not work perfectly in all situations
    " vnoremap y ygv"+y <bar> :'<,'>w !pbcopy<CR><CR>
    " nnoremap Y y$v$"+y$ <bar> :'<,'>w !pbcopy<CR><CR>
  endif
endif

" Increase amount of ctrlp results
let g:ctrlp_match_window = 'min:4,max:20,results:30'

" Setup Vimux
function! MuxSend()
  call inputsave()
  let command = input('Enter command: ')
  call inputrestore()
  call VimuxRunCommand(command)
endfunction

nnoremap <leader>m :call MuxSend()<CR>
