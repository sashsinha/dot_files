set nocompatible
filetype off

call plug#begin()

" Status line
Plug 'vim-airline/vim-airline'
" C/C++ formatting
Plug 'rhysd/vim-clang-format'
" Line number toggling
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" File tree explorer
Plug 'preservim/nerdtree'
" Code Autoformatter
Plug 'prettier/vim-prettier'
" Auto Pairs
Plug 'jiangmiao/auto-pairs'
" Color hex codes and color names
Plug 'chrisbra/colorizer'
" Colorscheme
Plug 'chriskempson/base16-vim'
" Ale
Plug 'dense-analysis/ale'
" Highlighted Yank
Plug 'machakann/vim-highlightedyank'
" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" VIM Rooter
Plug 'airblade/vim-rooter'
" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Dev icons
Plug 'ryanoasis/vim-devicons'
" Jump to any location specified by two characters
Plug 'justinmk/vim-sneak'
" Vim fuGITive
Plug 'tpope/vim-fugitive'
" Leetcode
Plug 'ianding1/leetcode.vim'
" Startify
Plug 'mhinz/vim-startify'
" Vim Zoom
Plug 'szw/vim-maximizer'

" All of your Plugs must be added before the following line
call plug#end()            " required

" Misc. settings
set clipboard=unnamed
set nofoldenable
set number
set relativenumber
set smartindent
set wildmode=longest,list,full
set wildmenu
set encoding=utf-8
set scrolloff=2
set timeoutlen=400 ttimeoutlen=0
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set backspace=indent,eol,start
set mouse=a " Enable mouse usage (all modes) in terminals
set ttyfast
set lazyredraw

" Colors
if !has('gui_running')
  set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif
set background=dark
let base16colorspace=256
colorscheme base16-material

" Sane splits
set splitright
set splitbelow

" Tab size
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" Set permanent undo directory
if !isdirectory($HOME."/.config/nvim")
    call mkdir($HOME."/.config/nvim", "", 0770)
endif
if !isdirectory($HOME."/.config/nvim/undo-dir")
    call mkdir($HOME."/.config/nvim/undo-dir", "", 0700)
endif
set undodir=~/.config/nvim/undo-dir
set undofile

" Cusom line number coloring
if !has('nvim')
    set cursorline
    set cursorlineopt=number
endif
highlight LineNR cterm=none ctermfg=245 ctermbg=none
highlight CursorLineNR cterm=bold ctermfg=253 ctermbg=none

" Jump to the last position when reopening files
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" Enable syntax highlighting
syntax on

" ; as :
nnoremap ; :

" Map leader key to <Space>
let mapleader = "\<Space>"

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<CR>

" <leader>q shows stats
nnoremap <leader>q g<c-g>

" Keymap for replacing up to next _ or -
noremap <leader>m ct_

" Jump to start and end of line using the home row keys
map H ^
map L $

" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
noremap <leader>p :read !xsel --clipboard --output<CR>
noremap <leader>c :w !xsel -ib<CR><cr>

" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move by line
nnoremap j gj
nnoremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Open NERDTree with <Space> + n
nmap <Leader>n :NERDTreeToggle<CR>
" Show hidden files/folders by default in NERDTree
let NERDTreeShowHidden=1

" Toggle visible whitespace with <Space> + W
nnoremap <leader>W :setlocal list!<CR>

" Turn on colorizer for certain filetypes
let g:colorizer_auto_filetype='css,html,yaml,xml'

" Conquerer of Completion
source $HOME/.config/nvim/plug-config/coc.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM fuGtITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" Leetcode vim
nnoremap <leader>ll :LeetCodeList<CR>
nnoremap <leader>lt :LeetCodeTest<CR>
nnoremap <leader>ls :LeetCodeSubmit<CR>
nnoremap <leader>li :LeetCodeSignIn<CR>

nmap <leader>p :let g:leetcode_solution_filetype = 'python3'<CR>
nmap <leader>j :let g:leetcode_solution_filetype = 'java'<CR>
let g:leetcode_browser = 'firefox'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Copy current file name to clipboard
nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap zoom into split
nmap <leader>z :MaximizerToggle<CR>
