return {
    {
        'rhysd/vim-clang-format',
        init = function()
            vim.g['clang_format#detect_style_file'] = true
            vim.g['clang_format#auto_format'] = true
        end
    }
}
