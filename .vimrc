set nocompatible


 "/$$$$$$$  /$$                     /$$
"| $$__  $$| $$                    |__/
"| $$  \ $$| $$ /$$   /$$  /$$$$$$  /$$ /$$$$$$$   /$$$$$$$
"| $$$$$$$/| $$| $$  | $$ /$$__  $$| $$| $$__  $$ /$$_____/
"| $$____/ | $$| $$  | $$| $$  \ $$| $$| $$  \ $$|  $$$$$$
"| $$      | $$| $$  | $$| $$  | $$| $$| $$  | $$ \____  $$
"| $$      | $$|  $$$$$$/|  $$$$$$$| $$| $$  | $$ /$$$$$$$/
"|__/      |__/ \______/  \____  $$|__/|__/  |__/|_______/
                         "/$$  \ $$
                        "|  $$$$$$/
                         "\______/

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
"Plug 'vimsence/vimsence'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'wakatime/vim-wakatime'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
call plug#end()


"  /$$$$$$            /$$
 "/$$__  $$          | $$
"| $$  \__/  /$$$$$$ | $$  /$$$$$$   /$$$$$$   /$$$$$$$
"| $$       /$$__  $$| $$ /$$__  $$ /$$__  $$ /$$_____/
"| $$      | $$  \ $$| $$| $$  \ $$| $$  \__/|  $$$$$$
"| $$    $$| $$  | $$| $$| $$  | $$| $$       \____  $$
"|  $$$$$$/|  $$$$$$/| $$|  $$$$$$/| $$       /$$$$$$$/
 "\______/  \______/ |__/ \______/ |__/      |_______/

let g:onedark_hide_endofbuffer = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 0

let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ }

let g:airline_theme='gruvbox'


" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme gruvbox 


  "/$$$$$$                                                   
 "/$$__  $$                                                  
"| $$  \__/ /$$   /$$  /$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$ 
"| $$      | $$  | $$ /$$__  $$ /$$_____/ /$$__  $$ /$$__  $$
"| $$      | $$  | $$| $$  \__/|  $$$$$$ | $$  \ $$| $$  \__/
"| $$    $$| $$  | $$| $$       \____  $$| $$  | $$| $$      
"|  $$$$$$/|  $$$$$$/| $$       /$$$$$$$/|  $$$$$$/| $$      
 "\______/  \______/ |__/      |_______/  \______/ |__/      
                                                            
" Cursor settings
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"


 "/$$      /$$ /$$                        
"| $$$    /$$$|__/                        
"| $$$$  /$$$$ /$$  /$$$$$$$  /$$$$$$$    
"| $$ $$/$$ $$| $$ /$$_____/ /$$_____/    
"| $$  $$$| $$| $$|  $$$$$$ | $$          
"| $$\  $ | $$| $$ \____  $$| $$          
"| $$ \/  | $$| $$ /$$$$$$$/|  $$$$$$$ /$$
"|__/     |__/|__/|_______/  \_______/|__/
                                         
" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" NERDTree
nmap nt :NERDTreeToggle<CR>

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR> " Toggle tabs and EOL

