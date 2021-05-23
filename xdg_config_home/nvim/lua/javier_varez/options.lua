
-- Global or window configurations
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.colorcolumn = '80,100'
vim.o.wildmenu = true
vim.o.wildmode = 'full'
vim.o.scrolloff = 8

-- configure ripgrep as grep program if available
if vim.fn.executable('rg') then
  vim.o.grepprg = 'rg --no-heading --vimgrep'
  vim.o.grepformat = '%f:%l:%c:%m'
end

-- Set the undo directory for the undo history
local data_dir = vim.fn.stdpath('data')
vim.o.undodir = data_dir..'/vimdid'

vim.o.listchars=[[eol:↵,trail:~,tab:>-,nbsp:␣]]
vim.wo.list = true

-- Disable highlighting after the search is done
vim.o.hlsearch = false

-- Enables having buffers in the background, without having to save them
vim.o.hidden = true

-- Disable the error bells
vim.o.errorbells = false

-- Disable swap and backup files
vim.o.swapfile = false
vim.o.backup = false

-- Set vim update time to 100 ms for a responsive GitGutter
vim.o.updatetime = 100

vim.o.showmode = false
