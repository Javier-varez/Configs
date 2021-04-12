" Fish doesn't play all that well with others
set shell=/bin/fish
let mapleader = "\<Space>"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'vim-syntastic/syntastic'
Plugin 'rust-lang/rust.vim' " Rust lang plugin
Plugin 'itchyny/lightline.vim' " Status bar
Plugin 'machakann/vim-highlightedyank' " Highlights the text that is yanked

" Fuzzy finder
Plugin 'airblade/vim-rooter'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

Plugin 'morhetz/gruvbox' " Color scheme
Plugin 'mbbill/undotree' " Undo tree plugin
Plugin 'junegunn/vim-emoji'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'rhysd/vim-clang-format'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-commentary'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

set relativenumber
set number
set wildmenu
set wildmode=full

let g:rustfmt_autosave = 1

" Tab configuration for C++ and C
augroup JAVIER_ALVAREZ
autocmd!
autocmd BufRead,BufNewFile *.cpp,*.c,*.h :set expandtab
autocmd BufRead,BufNewFile *.cpp,*.c,*.h :set tabstop=2
autocmd BufRead,BufNewFile *.cpp,*.c,*.h :set shiftwidth=2

" Use a column width of 72 for the commit messages
autocmd BufRead,BufNewFile COMMIT_EDITMSG :set colorcolumn=72

autocmd BufRead,BufNewFile CMakeLists.txt,*.cmake :set expandtab
autocmd BufRead,BufNewFile CMakeLists.txt,*.cmake :set tabstop=2
autocmd BufRead,BufNewFile CMakeLists.txt,*.cmake :set shiftwidth=2

autocmd BufReadPost *.rs setlocal filetype=rust

function! StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre *.h,*.c,*.cpp,*.java,*.rust,*.py,*.cmake,CMakeLists.txt :call StripTrailingWhitespaces()
augroup END

" Configures lightline status bar to show up
set laststatus=2

if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

set undodir=~/.vimdid
set undofile

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>
nnoremap <C-left> :tabp<CR>
nnoremap <C-right> :tabn<CR>

colorscheme gruvbox
set background=dark   " Setting light mode

" Disable highlighting after the search is done
set nohlsearch

" Enables having buffers in the background, without having to save them
set hidden

" Disable the error bells
set noerrorbells

" Disable swap and backup files
set noswapfile
set nobackup

" Set guides at 80 and 100 characters
set colorcolumn=80,100

" Normal terminal mode with Esc
"tnoremap <Esc> <C-\><C-n>
"tnoremap jj <C-\><C-n>

" leader configs

" Quick save
nmap <leader>w :w<CR>

nmap <leader>u :UndotreeToggle<CR>

" Open file
nnoremap <leader>e :call fzf#run({'source': 'git ls-files', 'sink': 'e'})<CR>
nnoremap <leader>o :call fzf#run({'sink': 'e'})<CR>

" Drop a buffer
nnoremap <leader>d :bd<CR>

" Open a terminal
nnoremap <leader>t :terminal<CR>i

" Reload vimrc
nnoremap <leader>r :source ~/.vimrc<CR>

nnoremap <leader>v :wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>

" window control
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-c> <C-w>c
nnoremap <A-v> <C-w>v

" Map jj to the escape key
inoremap jj <Esc>

" Configuration for Conqueror of completion
"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Trigger completion
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Move through the completion list
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Confirm completion choice
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Right>"
inoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Left>"

set completefunc=emoji#complete

nnoremap <leader>ze :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>
inoremap <C-z> <C-x><C-u>

" set vim update time to 100 ms for a responsive GitGutter
set updatetime=100

" Break undo sequences with , and ;
inoremap , ,<C-g>u
inoremap ; ;<C-g>u

" vim fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiffsplit<CR>

" Clang format
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1

" nerdtree
noremap <leader>n :NERDTreeToggle<CR>
