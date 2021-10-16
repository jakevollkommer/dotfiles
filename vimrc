set shell=/bin/zsh

" Use % to match pairs
runtime macros/matchit.vim
" Use vim over vi
set nocompatible
" Use filetype detection for plugins and indents
filetype plugin indent on

" Use vimplugged as the plugin package manager
call plug#begin('~/.vim/plugged')

" Plugins go here
" TODO go through plugins, see what's good, get more?
" TODO check out easymotion
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" post install (yarn install | npm install) then load plugin only for editing supported files
" TODO prettier should run on save
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()

" Toggle NERDTree with Ctrl + n
map <C-n> :NERDTreeToggle<CR>

" TODO learn some snippets https://github.com/SirVer/ultisnips

" TODO use kite
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line
let g:kite_tab_complete=1

" Line Numbers
set number
set numberwidth=5

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup      " Immediately delete backup file on successful write
set nowritebackup
set history=500   " Search patterns and command line entries
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching as you're typing
set hlsearch      " highlight matches
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set smartcase
set ignorecase
set noantialias

" highlight vertical column of cursor
" TODO does this work? Do I want this?
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline
set cursorline

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
" When you’re navigating through <TAB> space, the cursor will jump from one end to another. If you want to turn the <TAB> space into normal spaces, use the following one.
" set expandtab
" TODO what does this change?
" set softtabstop=4

" Some filetypes should use 2 spaces for tabs
autocmd BufRead,BufNewFile *.htm,*.html,*.css,*.js,*.json,Podfile setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" For smoother and faster macros
set lazyredraw

" Stop highlighting
nnoremap <leader><space> :nohlsearch<CR>

" Foldable code blocks
set foldenable
" Only heavily nested blocks are folded by default
set foldlevelstart=10
" Fold based on indentation
set foldmethod=indent
" Open/close folds with semicolon
nnoremap ; za

" Move up/down visually without having to go left/right
nnoremap j gj
nnoremap k gk

" Leader Mappings
" Use Space as the leader
map <Space> <leader>
" Add a semicolon to the current line without moving the cursor
nnoremap <Leader>; m'A;<ESC>`'
" Source vimrc with <Leader>vc
nnoremap <Leader>vc :source ~/.vimrc<CR>:echo "Reloaded .vimrc"<CR>
map <Leader>w :update<CR>
map <Leader>q :q<CR>
" TODO how can git help me here? says not found
" map <Leader>gs :Gstatus<CR>
" map <Leader>gc :Gcommit<CR>
" map <Leader>gp :Gpush<CR>

" fix typos for saving/quitting
nmap :W :w
nmap :Q :q
nmap :wQ :wq
nmap :Wq :wq

" have jsx highlighting/indenting work in .js files as well
let g:jsx_ext_required = 0

" session plug-in will ask whether you want to restore your default session.
:au FocusLost * :wa

" Session plug-in will ask whether you want to restore your default session.
let g:session_autoload = 'no'

" Automatically turn paste mode on/off when pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to search word under cursor
" TODO why doesn't this work?
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Persistent undo
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile
set undolevels=1000
set undoreload=10000

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Remove trailing writespace on save
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" TODO find better one that doesn't annoy me
" Add this to plugins too https://github.com/alvan/vim-closetag
let g:closetag_filenames = "*.js,*.html,*.xhtml,*.phtml"
