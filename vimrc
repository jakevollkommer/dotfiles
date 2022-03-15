set shell=/bin/zsh

" Use % to match pairs
runtime macros/matchit.vim
" Use filetype detection for plugins and indents
filetype plugin indent on

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set nocompatible          " Use Vim over vi
set cursorline            " Highlight cursor
set backspace=2           " Backspace deletes like most programs in insert mode
set nobackup              " Immediately delete backup file on successful write
set nowritebackup
set history=500           " Search patterns and command line entries
set ruler                 " show the cursor position all the time
set showcmd               " display incomplete commands
set incsearch             " do incremental searching as you're typing
set hlsearch              " highlight matches
set laststatus=2          " Always display the status line
set autowrite             " Automatically :write before running commands
set ignorecase            " Case insensitive searching
set smartcase             " Overrides ignorecase if searching for capitals
set tabstop=4             " Softtabs, 4 spaces
set shiftwidth=4          " Use spaces instead of tabs
set expandtab
set scrolloff=10          " Do not let cursor scroll below or above N number of lines when scrolling.
set lazyredraw            " For smoother and faster macros
set number                " Line Numbers
set relativenumber        " Hybrid line numbers
set nu rnu
set mouse=a               " Set all mouse modes
set clipboard=unnamed     " Use the system clipboard
set path+=**              " Search down into subfolders
set numberwidth=5
if !has('nvim')
    set noantialias
endif
set undodir=~/.vim/undo-dir
set undofile
set undolevels=1000
set undoreload=10000

set foldenable         " Fold by default
set foldmethod=indent  " Fold based on indentation
set foldlevelstart=10  " Only heavily nested blocks are folded by default

" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Automatically toggle absolute and relative line numbers
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" PLUGINS ---------------------------------------------------------------- {{{

" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

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
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/csv.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sindrets/winshift.nvim'
Plug 'preservim/vimux'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" TODO prettier should run on save
call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Leader Mappings
" Use Space as the leader
map <Space> <leader>
" Toggle NERDTree
map <Leader>t :NERDTreeToggle<CR>
" Add a semicolon to the current line without moving the cursor
nnoremap <Leader>; m'A;<ESC>`'
" Source vimrc with <Leader>vc
nnoremap <Leader>vc :source ~/.vimrc<CR>:echo "Reloaded .vimrc"<CR>
map <Leader>w :update<CR>
map <Leader>q :q<CR>
" Toggle highlighting
nnoremap <leader><space> :set hlsearch! hlsearch?<cr>
" Execute the current file with Python.
" nnoremap <Leader>p :w <CR>:!clear <CR>:!python % <CR>
" Source the currnt file
nnoremap <Leader>s :w<CR>:so %<CR>
" Firebase deploy functions in the current directory
" call CR twice to cancel function deletion
nnoremap <Leader>f :w <CR>:call VimuxRunCommand("firebase deploy --only functions")<CR><CR>
" Easily switch buffers
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>d :bd<CR>

" Get out of insert mode
imap jk <Esc>

" Keep on indenting
vmap < <gv
vmap > >gv

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

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Open/close folds with single quote
nnoremap ' za

" Grep the word underneath the cursor
nnoremap gr :grep <cword> *<CR>
" Grep the word underneath the cursor, searching only current file's directory
nnoremap Gr :grep <cword> %:p:h/*<CR>

" Move up/down visually without having to go left/right
nnoremap j gj
nnoremap k gk

" TODO how can git help me here? says not found
" map <Leader>gs :Gstatus<CR>
" map <Leader>gc :Gcommit<CR>
" map <Leader>gp :Gpush<CR>

" Start inserting at the corect indentation on an empty line
nnoremap <tab> ddO

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" scroll the viewport faster
nnoremap <C-e> 3<c-e>
nnoremap <C-y> 3<c-y>

" Yank from cursor to the end of line.
nnoremap Y y$

" fix typos for saving/quitting
nmap :W :w
nmap :Q :q
nmap :wQ :wq
nmap :Wq :wq

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" bind K to search word under cursor
" TODO why doesn't this work?
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Create the `tags file`
command! MakeTags !ctags -R .

" Automatically turn paste mode on/off when pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

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

" Some filetypes should use 2 spaces for tabs
autocmd BufRead,BufNewFile *.htm,*.html,*.css,*.js,*.json,Podfile setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" TODO learn some snippets https://github.com/SirVer/ultisnips

" TODO use kite
" set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
" set laststatus=2  " always display the status line
" let g:kite_tab_complete=1

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" have jsx highlighting/indenting work in .js files as well
let g:jsx_ext_required = 0

" session plug-in will ask whether you want to restore your default session.
:au FocusLost * :wa

" Session plug-in will ask whether you want to restore your default session.
let g:session_autoload = 'no'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Persistent undo
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif

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

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
augroup END

" TODO find better one that doesn't annoy me
" Add this to plugins too https://github.com/alvan/vim-closetag
let g:closetag_filenames = "*.js,*.html,*.xhtml,*.phtml"

" }}}
