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
Plugin 'ycm-core/YouCompleteMe' " Autocompletion, syntax highlighting, error detection, etc
Plugin 'rust-lang/rust.vim' " Rust lang plugin
Plugin 'itchyny/lightline.vim' " Status bar
Plugin 'machakann/vim-highlightedyank' " Highlights the text that is yanked

" Fuzzy finder
Plugin 'airblade/vim-rooter'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

Plugin 'gruvbox-comunity/gruvbox' " Color scheme
Plugin 'mbbill/undotree' " Undo tree plugin

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

highlight YcmErrorSection ctermbg=red ctermfg=white
highlight YcmWarningSection ctermbg=yellow ctermfg=black

nnoremap gi :YcmCompleter GoToInclude<CR>
nnoremap gd :YcmCompleter GoToDefinition<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap fi :YcmCompleter FixIt<CR>
nnoremap rr :YcmCompleter RefactorRename 
nnoremap doc :YcmCompleter GetDoc<CR> 

let g:ycm_clangd_args = [ '--cross-file-rename' ]
let g:ycm_language_server =
\ [
\   {
\     'name': 'rust',
\     'cmdline': ['rust-analyzer'],
\     'filetypes': ['rust'],
\     'project_root_files': ['Cargo.toml']
\   }
\ ]

let g:rustfmt_autosave = 1

" Tab configuration for C++ and C
augroup JAVIER_ALVAREZ
autocmd!
autocmd BufRead,BufNewFile *.cpp,*.c,*.h :set expandtab
autocmd BufRead,BufNewFile *.cpp,*.c,*.h :set tabstop=2
autocmd BufRead,BufNewFile *.cpp,*.c,*.h :set shiftwidth=2

" Use a column width of 72 for the commit messages
autocmd BufRead,BufNewFile COMMIT_EDITMSG :set colorcolumn=72

autocmd BufReadPost *.rs setlocal filetype=rust

function! StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre *.h,*.c,*.cpp,*.java,*.rust,*.py :call StripTrailingWhitespaces()

function FormatBuffer()
  if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
    let cursor_pos = getpos('.')
    :%!clang-format
    call setpos('.', cursor_pos)
  endif
endfunction

autocmd BufWritePre *.h,*.hpp,*.c,*.cpp :call FormatBuffer()
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
tnoremap <Esc> <C-\><C-n>

" leader configs

" Quick save
nmap <leader>w :w<CR>

" Quick exit
nmap <leader>q :q<CR>
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

" window control
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-c> <C-w>c
nnoremap <A-v> <C-w>v

