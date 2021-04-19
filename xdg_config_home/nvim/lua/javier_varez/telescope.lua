
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')

local get_cursor_position = function(buffer)
    local cursor = vim.api.nvim_win_get_cursor(0)
    local row = cursor[1] - 1
    local column = cursor[2]

    -- We want to get the next position
    local current_line = vim.api.nvim_buf_get_lines(buffer, row, row + 1, true)
    if #current_line[1] > 0 then
        column = column + 1;
    end

    return {
        row = row,
        column = column
    }
end

local M = {}
M.search_vimrc = function()
    require('telescope.builtin').find_files {
        prompt_title = "NeoVim Configuration",
        cwd = "~/.config/nvim/"
    }
end

M.emoji_finder = function()
    local pickers = require('telescope.pickers')
    local finders = require('telescope.finders')
    local sorters = require('telescope.sorters')
    local action_set = require('telescope.actions.set')
    local action_state = require('telescope.actions.state')
    local emojis = require('javier_varez.emojis')

    local buffer = vim.api.nvim_get_current_buf()
    local cursor = get_cursor_position()

    pickers.new(nil, {
        prompt_title = 'Search emojis',
        finder = finders.new_table {
            results = emojis,
            entry_maker = function(entry)
                return {
                    value = entry.symbol,
                    ordinal = entry.keywords[1],
                    display = entry.symbol
                }
            end,
        },
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function()
            action_set.select:replace(function()
                local emoji = action_state.get_selected_entry()
                vim.api.nvim_buf_set_text(buffer, cursor.row, cursor.column,
                    cursor.row, cursor.column, { emoji.value })
            end)
            return true
        end
    }):find()
end

return M
