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
                ensure_installed = {'org', 'c', 'cpp', 'rust', 'go', 'lua', 'json', 'vim', 'vimdoc'},
            }
        end
    }
}
