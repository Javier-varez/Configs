
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
vim.api.nvim_set_keymap('n', '<leader>fb', '<Cmd>lua require("telescope").current_buffer_fuzzy_find()<CR>', {
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
vim.api.nvim_set_keymap('n', 'gd', '<plug>(coc-definition)', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', 'gy', '<plug>(coc-type-definition)', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', 'gi', '<plug>(coc-implementation)', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', 'gr', '<plug>(coc-references)', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', 'rr', '<plug>(coc-rename)', { noremap = true, silent=true })

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
