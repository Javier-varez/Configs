return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        init = function()
            local actions = require'telescope.actions'
            require('telescope').setup{
                defaults = {
                    mappings = {
                        i = {
                            ["<CR>"] = "select_tab",
                        },
                        n = {
                            ["<CR>"] = "select_tab",
                        },
                    },
                },
            }
        end
    }
}
