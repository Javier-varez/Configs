local M = {}

M.search_vimrc = function()
    require('telescope.builtin').find_files {
        prompt_title = "neovim configuration",
        cwd = "~/.config/nvim/"
    }
end

M.search_plugins = function()
    require('telescope.builtin').find_files {
        prompt_title = "neovim plugins",
        cwd = "~/.local/share/nvim/site/pack/packer/start/"
    }
end

return M
