return {
    {
        'nvim-telescope/telescope.nvim',
        init = function()
            local actions = require'telescope.actions'
            require('telescope').setup{
                defaults = {
                    mappings = {
                        i = {
                            ["<CR>"] = actions.select_tab,
                        },
                        n = {
                            ["<CR>"] = actions.select_tab,
                        },
                    },
                },
            }
        end
    }
}
