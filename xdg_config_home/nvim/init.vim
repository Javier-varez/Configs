
set shell=/bin/fish
let mapleader = "\<Space>"

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim' " Rust lang plugin
Plug 'itchyny/lightline.vim' " Status bar
Plug 'machakann/vim-highlightedyank' " Highlights the text that is yanked
Plug 'airblade/vim-rooter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'morhetz/gruvbox' " Color scheme
Plug 'mbbill/undotree' " Undo tree plugin
Plug 'junegunn/vim-emoji'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'rhysd/vim-clang-format'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'mklabs/vim-cowsay'

" All of your Plugins must be added before the following line
call plug#end()

set relativenumber
set number
set wildmenu
set wildmode=full
set scrolloff=8

let g:rustfmt_autosave = 1

" Sensible defaults for tab config
set expandtab
set tabstop=4
set shiftwidth=4

" Tab configuration for C++ and C
augroup JAVIER_ALVAREZ
autocmd!
autocmd BufRead,BufNewFile *.cpp,*.c,*.h :set expandtab
autocmd BufRead,BufNewFile *.cpp,*.c,*.h :set tabstop=2
autocmd BufRead,BufNewFile *.cpp,*.c,*.h :set shiftwidth=2

" Use a column width of 72 for the commit messages
autocmd BufRead,BufNewFile COMMIT_EDITMSG :set colorcolumn=50,72

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
nmap <leader>q :q<CR>
nmap <leader>Q :qall!<CR>

nmap <leader>u :UndotreeToggle<CR>

" Search project
nnoremap <leader>ps <CMD>Telescope live_grep<CR>
nnoremap <leader>ff <CMD>Telescope find_files<CR>

" Drop a buffer
nnoremap <leader>d :bd<CR>

" Open a terminal
nnoremap <leader>t :terminal<CR>i

" Reload vimrc
nnoremap <leader>r :source $MYVIMRC<CR>

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
nmap <silent> rr <Plug>(coc-rename)

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

" Move through the completion list. Otherwise S-Tab inserts an actual tab.
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-V>\<Tab>"

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
