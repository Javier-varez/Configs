vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    callback = function(_)
        vim.bo.undofile = true
        vim.bo.expandtab = true
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
    end
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.go"},
    callback = function(_)
        vim.bo.expandtab = false
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
    end
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"COMMIT_EDITMSG"},
    callback = function(_)
        vim.wo.colorcolumn = "50,72"
    end
})
