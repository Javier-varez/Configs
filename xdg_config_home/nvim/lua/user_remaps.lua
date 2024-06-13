-- No arrow keys. Force yourself to use the home row
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent=true })

--  Left and right can switch buffers
vim.api.nvim_set_keymap('n', '<Left>', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<Right>', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<C-h>', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<C-l>', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent=true })

-- Quick save
vim.api.nvim_set_keymap('n', '<Leader>w', '<Cmd>w<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<Leader>q', '<Cmd>q<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<Leader>Q', '<Cmd>qall!<CR>', { noremap = true, silent=true })

-- Toggle Undo Tree
vim.api.nvim_set_keymap('n', '<Leader>u', '<Cmd>UndotreeToggle<CR>', {
    noremap = true,
    silent=true
})

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ps', '<Cmd>Telescope live_grep<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>fr', '<Cmd>lua require"telescope.builtin".lsp_references{}<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>fs', '<Cmd>lua require"telescope.builtin".lsp_dynamic_workspace_symbols{}<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>fd', '<Cmd>lua require"telescope.builtin".diagnostics{}<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>fv', '<Cmd>lua require("javier_varez.telescope").search_vimrc() <CR>', {
    noremap = true,
    silent=true
})

-- Drop a buffer
vim.api.nvim_set_keymap('n', '<leader>d', '<Cmd>bd<CR>', { noremap = true, silent=true })

-- Open a terminal
vim.api.nvim_set_keymap('n', '<leader>t', '<Cmd>tabe<CR><Cmd>terminal<CR>i', { noremap = true, silent=true })

-- Window control
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<A-c>', '<C-w>c', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<A-v>', '<C-w>v', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<A-s>', '<C-w>s', { noremap = true, silent=true })

-- Map jj to the escape key
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent=true })

-- Break undo sequences with , and ;
vim.api.nvim_set_keymap('i', ',', ',<C-g>u', { noremap = true, silent=true })
vim.api.nvim_set_keymap('i', ';', ';<C-g>u', { noremap = true, silent=true })

-- Vim Fugitive
vim.api.nvim_set_keymap('n', '<Leader>gs', '<Cmd>Git status<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<Leader>gd', '<Cmd>Gdiffsplit<CR>', { noremap = true, silent=true })

-- NvimTree
vim.api.nvim_set_keymap('n', '<Leader>n', '<Cmd>NvimTreeToggle<CR>', {
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

vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', {noremap = true, silent = true, expr = true})
