return {
    {
        'rebelot/kanagawa.nvim',
        init = function()
            -- Default options:
            require('kanagawa').setup({
                undercurl = true,           -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = {},
                variablebuiltinStyle = { italic = true },
                specialReturn = true,       -- special highlight for the return keyword
                specialException = true,    -- special highlight for exception handling keywords
                transparent = true,        -- do not set background color
                colors = {},
            })

            -- Set the color scheme
            vim.cmd('colorscheme kanagawa')
        end
    }
}
