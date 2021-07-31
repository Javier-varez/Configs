
-- No arrow keys. Force yourself to use the home row
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent=true })

--  Left and right can switch buffers
vim.api.nvim_set_keymap('n', '<Left>', '<Cmd>tabp<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<Right>', '<Cmd>tabn<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<Cmd>bp<CR>', { noremap = true, silent=true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<Cmd>bn<CR>', { noremap = true, silent=true })

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

-- AOSP nvim plugin
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
vim.api.nvim_set_keymap('n', '<leader>ab', '<Cmd>lua require("aosp_nvim").build_target({ host_module = true })<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>ap', '<Cmd>lua require("aosp_nvim").build_and_push()<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>ad', '<Cmd>lua require("aosp_nvim").toggle_display()<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>ag', '<Cmd>lua require("aosp_nvim.telescope").live_grep()<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>af', '<Cmd>lua require("aosp_nvim.telescope").find_files()<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>ac', '<Cmd>lua require("aosp_nvim").compdb()<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>ar', '<Cmd>lua require("aosp_nvim").rebuild_module_info()<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>atd', '<Cmd>lua require("aosp_nvim").run_test()<CR>', {
    noremap = true,
    silent=true
})
vim.api.nvim_set_keymap('n', '<leader>ath', '<Cmd>lua require("aosp_nvim").run_test({ host_module = true })<CR>', {
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

vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', {noremap = true, silent = true, expr = true})

-- Completion configuration
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

_G.cr_confirm_completion = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-y>"
  else
    return t "<C-g>u<CR>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<CR>", "v:lua.cr_confirm_completion()", {expr = true, noremap = true})
vim.api.nvim_set_keymap("i", "<CR>", "v:lua.cr_confirm_completion()", {expr = true, noremap = true})
