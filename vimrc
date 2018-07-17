" Leader
let mapleader = " "

" LocalLeader
let maplocalleader = "\\"

syntax on
colorscheme jellybeans

highlight Normal guibg=black guifg=white ctermbg=black
hi specialKey ctermbg=black ctermfg=17

au BufRead,BufNewFile *.conf setfiletype nginx
au BufRead,BufNewFile *.block setfiletype pug
au BufRead,BufNewFile *.list setfiletype pug

au BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufRead,BufNewFile *.gs set filetype=genie
autocmd BufRead,BufNewFile .babelrc set filetype=json

if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

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
" let g:syntastic_javascript_checkers = ['eslint']

" Mouse support
set mouse=a

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_c = '%F'

" Save and close a file without quitting vim
nnoremap <leader>w :w<bar>bd<CR>

" Save the current file when accidently stuck in readonly mode
nnoremap <leader>W :w ! sudo tee %<CR>

" Reload vimrc
nnoremap <C-U> :source $MYVIMRC<CR>

" Default tab settings
nnoremap <C-T> :set ts=2 sts=2 sw=2 expandtab smarttab<CR>:retab<CR>

" gf that selects inside single quotes before running
nnoremap <leader>f vi'gf

" Toggle syntastic checker
nnoremap <C-M> :SyntasticToggleMode<CR>

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

nnoremap <leader>c :VimuxCloseRunner<CR>
nnoremap <leader>z :VimuxZoomRunner<CR>
nnoremap <leader>m :call MuxSend()<CR>

" Configure youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" Add devkitarm headers to include paths
"let g:syntastic_c_include_dirs = ['/opt/devkitpro/libnds/include/', '/opt/devkitpro/libgba/include/', '/opt/devkitpro/libctru/include/', '/opt/devkitpro/libmirko/include/']
"let g:syntastic_cpp_include_dirs = ['/opt/devkitpro/libnds/include/', '/opt/devkitpro/libgba/include/', '/opt/devkitpro/libctru/include/', '/opt/devkitpro/libmirko/include/']

let g:syntastic_html_tidy_quiet_messages = { "level": "warnings" }
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++14'
let g:syntastic_cpp_config_file = '.vim_syntax'

" Overall path lookup helper (gf)
:set path=$PWD/**

" Disable Flow by default
let g:flow#enable = 0
let g:syntastic_javascript_checkers = []

" Enable syntastic for javascript files
function! FlowEnable()
  if search("@flow", 'W') != 0
    let g:flow#enable = 1
    let g:flow#autoclose = 1
    let g:syntastic_javascript_checkers = ['flow']
    let g:syntastic_javascript_flow_exe = 'flow'
  endif
endfunction

function! FlowDisable()
  let g:flow#enable = 0
  let g:flow#autoclose = 0
  let g:syntastic_javascript_checkers = []
  let g:syntastic_javascript_flow_exe = ''
endfunction

let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

" Attempt to fix vue slowness
let g:vue_disable_pre_processors=1

au BufReadPost *.js call FlowEnable()

" Plug 'wesQ3/vim-windowswap'
" Swap windows using <leader>ww

" Use black background for window
" set color for tabs as a subtle color
" https://jonasjacek.github.io/colors/
highlight Normal guibg=black guifg=white ctermbg=233
highlight ColorColumn ctermbg=234
hi specialKey ctermbg=233 ctermfg=234

" Attempt to fix highlighting of backticks enclosed strings
" Highlight ES6 template strings
hi link javaScriptTemplateDelim String
hi link javaScriptTemplateVar Text
hi link javaScriptTemplateString String

" Disable syntastic html checkers by default
let g:syntastic_html_checkers=['']
let g:indentLine_concealcursor=""

" Concel quotes around keys while not on json line
let g:vim_json_syntax_conceal = 1
