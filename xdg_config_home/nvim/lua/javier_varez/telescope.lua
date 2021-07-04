
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
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')

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
