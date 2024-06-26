return {
    'machakann/vim-highlightedyank',
    'airblade/vim-rooter',
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'mbbill/undotree',
    -- tpope magic
    'tpope/vim-commentary',
    {
        'tpope/vim-sensible',
        init = require('user_options').init,
    },
    'tpope/vim-fugitive',
    'tpope/vim-surround',
    'mklabs/vim-cowsay',
    -- Git diff markers
    { 'airblade/vim-gitgutter', branch = 'main' },
    -- Vim status line
    {
        'freddiehaddad/feline.nvim',
        opts = {},
        config = function(_, opts)
            -- required by feline
            vim.o.termguicolors = true
            require('feline').setup({})
        end
    },
    {
        'cappyzawa/trim.nvim',
        init = function() require('trim').setup({}) end
    },
    {
        'yamatsum/nvim-nonicons',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        init = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            vim.o.termguicolors = true
            require('nvim-tree').setup({})
        end
    },
    -- Vim buffer line
    {
        'akinsho/bufferline.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        init = function()
            require'bufferline'.setup {
                options = {
                    mode = "tabs"
                }
            }
        end
    },
    -- Noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
          "MunifTanjim/nui.nvim",
          "rcarriga/nvim-notify",
        }
    },
}
