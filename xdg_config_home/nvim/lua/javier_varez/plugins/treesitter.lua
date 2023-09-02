return {
    {
        'nvim-treesitter/nvim-treesitter',
        init = function()
            require'nvim-treesitter.configs'.setup {
                highlight = {
                    enable = true,

                    -- Required for spellcheck, some LaTex highlights and
                    -- code block highlights that do not have ts grammar
                    additional_vim_regex_highlighting = {'org'},
                },
                indent = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
                ensure_installed = {'org'}, -- Or run :TSUpdate org
            }
        end
    }
}
