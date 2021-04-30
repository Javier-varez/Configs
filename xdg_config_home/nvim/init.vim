
lua << EOF
-- Set the leader key to space
vim.g.mapleader = ' '

-- Clang format
vim.api.nvim_exec("let g:clang_format#detect_style_file = 1", false)
vim.api.nvim_exec("let g:clang_format#auto_format = 1", false)

require('javier_varez.plugins')
require('javier_varez.options')
require('javier_varez.autocmds')
require('javier_varez.remaps')
require('javier_varez.telescope')
EOF

" Conquer of completion
" Use <tab> for trigger completion and navigate to the next complete item
function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Trigger completion
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackSpace() ? "\<Tab>" :
      \ coc#refresh()

" Move through the completion list. Otherwise S-Tab inserts an actual tab.
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-V>\<Tab>"

" Confirm completion choice
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
