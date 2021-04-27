
-- No arrow keys. Force yourself to use the home row
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent=true })

--  Left and right can switch buffers
vim.api.nvim_set_keymap('n', '<Left>', '<Cmd>bp<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<Right>', '<Cmd>bn<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<Cmd>tabp<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<Cmd>tabn<CR>', { noremap = true, silent=true })

-- Quick save
vim.api.nvim_set_keymap('n', '<Leader>w', '<Cmd>w<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<Leader>q', '<Cmd>q<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<Leader>Q', '<Cmd>qall!<CR>', { noremap = true, silent=true })

-- Toggle Undo Tree
vim.api.nvim_set_keymap('n', '<Leader>u', '<Cmd>UndotreeToggle<CR>', {
    noremap = true,
    silent=true
})

-- Search project
vim.api.nvim_set_keymap('n', '<leader>ps', '<Cmd>Telescope live_grep<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>fv', '<Cmd>lua require("javier_varez.telescope").search_vimrc() <CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>fp', '<Cmd>lua require("javier_varez.telescope").search_plugins() <CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>fe', '<Cmd>lua require("neomoji").find()<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('i', '<A-e>', '<C-o><Cmd>lua require("neomoji").find()<CR>', {
    noremap = false,
    silent=false
})
vim.api.nvim_set_keymap('n', '<leader>ab', '<Cmd>lua require("aosp_nvim").build_target()<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>ar', '<Cmd>lua require("plenary.reload").reload_module("aosp_nvim")<CR>', {
    noremap = true,
    silent = false
})

-- Drop a buffer
vim.api.nvim_set_keymap('n', '<leader>d', '<Cmd>bd<CR>', { noremap = true, silent=true })

-- Open a terminal
vim.api.nvim_set_keymap('n', '<leader>t', '<Cmd>terminal<CR>i', { noremap = true, silent=true })

-- Window control
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<A-c>', '<C-w>c', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<A-v>', '<C-w>v', { noremap = true, silent=true })

-- Map jj to the escape key
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent=true })

--
-- Configuration for Conquer of Completion
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { noremap = false, silent=false })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { noremap = false, silent=false })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { noremap = false, silent=false })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { noremap = false, silent=false })
vim.api.nvim_set_keymap('n', 'rr', '<Plug>(coc-rename)', { noremap = false, silent=false })
vim.api.nvim_set_keymap('n', 'gf', '<Plug>(coc-fix-current)', { noremap = false, silent=false })

-- Remap <C-f> and <C-b> for scroll float windows/popups.
vim.api.nvim_set_keymap('n', 'C-f', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', 'C-b', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('i', 'C-f', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<Right>"', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('i', 'C-b', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<Left>"', {
    noremap = true,
    silent=true
})

-- Break undo sequences with , and ;
vim.api.nvim_set_keymap('i', ',', ',<C-g>u', { noremap = true, silent=true })
vim.api.nvim_set_keymap('i', ';', ';<C-g>u', { noremap = true, silent=true })

-- Vim Fugitive
vim.api.nvim_set_keymap('n', '<Leader>gs', '<Cmd>Gstatus<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<Leader>gd', '<Cmd>Gdiffsplit<CR>', { noremap = true, silent=true })

-- NerdTree
vim.api.nvim_set_keymap('n', '<Leader>n', '<Cmd>NERDTreeToggle<CR>', {
    noremap = true,
    silent=true
})

-- Reload current lua file
vim.api.nvim_set_keymap('n', '<Leader>rcf', '<Cmd>luafile %<CR>', {
    noremap = true,
    silent=false
})

-- lua tests
vim.api.nvim_set_keymap('n', '<Leader>lt', '<Plug>PlenaryTestFile', {
    noremap = false,
    silent=false
})
