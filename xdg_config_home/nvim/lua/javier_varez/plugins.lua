require('packer').startup(function()
    local use = use
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'
    use 'machakann/vim-highlightedyank'
    use 'airblade/vim-rooter'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'mbbill/undotree'
    use 'airblade/vim-gitgutter'
    use 'rhysd/vim-clang-format'
    use 'tpope/vim-commentary'
    use 'tpope/vim-sensible'
    use 'tpope/vim-fugitive'
    use 'mklabs/vim-cowsay'
    use 'mhinz/vim-startify'
    use 'tpope/vim-surround'
    use 'cappyzawa/trim.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'saecki/crates.nvim'
    use "rebelot/kanagawa.nvim"
    use 'dcampos/nvim-snippy'
    use 'dcampos/cmp-snippy'
    use 'rhysd/vim-grammarous'
    use 'fatih/vim-go'
    use { 'yamatsum/nvim-nonicons', requires = {'kyazdani42/nvim-web-devicons'} }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use 'feline-nvim/feline.nvim'
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

end)

require('trim').setup({
    disable = { "markdown" },
})

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
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
    playground = {
        enable = true,
    },
}

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
    overrides = {},
})

-- Set the color scheme
vim.cmd('colorscheme kanagawa')

-- Rustfmt config
vim.g.rustfmt_autosave = true

-- Clang format
vim.g['clang_format#detect_style_file'] = true
vim.g['clang_format#auto_format'] = true

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- lsp config

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space><space>d', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space><space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- Lsp highlights
    -- Errors in Red
    vim.api.nvim_command('hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red')
    -- Warnings in Yellow
    vim.api.nvim_command('hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow')
    -- Info and Hints in White
    vim.api.nvim_command('hi LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White')
    vim.api.nvim_command('hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White')

    vim.api.nvim_command('hi LspDiagnosticsUnderlineError guifg=NONE ctermfg=NONE cterm=underline gui=underline')
    vim.api.nvim_command('hi LspDiagnosticsUnderlineWarning guifg=NONE ctermfg=NONE cterm=underline gui=underline')
    vim.api.nvim_command('hi LspDiagnosticsUnderlineInformation guifg=NONE ctermfg=NONE cterm=underline gui=underline')
    vim.api.nvim_command('hi LspDiagnosticsUnderlineHint guifg=NONE ctermfg=NONE cterm=underline gui=underline')

end

local cmp_lsp_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "clangd", "jedi_language_server", "gopls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = cmp_lsp_capabilities
    }
end

-- Rust tools
--
local rust_on_attach = function(a, bufnr)
    on_attach(a, bufnr)

    -- Rust specific mappings.
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'K', '<Cmd>lua require"rust-tools.hover_actions".hover_actions()<CR>', opts)
    buf_set_keymap('n', '<space>rr', '<Cmd>lua require("rust-tools.runnables").runnables()<CR>', opts)
    buf_set_keymap('n', '<space>rc', '<Cmd>lua require"rust-tools.open_cargo_toml".open_cargo_toml()<CR>', opts)
end

local rust_tools_opts = {
    tools = { -- rust-tools options
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,

        -- Whether to show hover actions inside the hover window
        -- This overrides the default hover handler
        hover_with_actions = true,

        runnables = {
            -- whether to use telescope for selection menu or not
            use_telescope = true

            -- rest of the opts are forwarded to telescope
        },

        debuggables = {
            -- whether to use telescope for selection menu or not
            use_telescope = true

            -- rest of the opts are forwarded to telescope
        },

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",

            -- wheter to show parameter hints with the inlay hints or not
            show_parameter_hints = true,

            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "Comment",
        },

        hover_actions = {
            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
                {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                {"╰", "FloatBorder"}, {"│", "FloatBorder"}
            },

            -- whether the hover action window gets automatically focused
            auto_focus = false
        }
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        on_attach = rust_on_attach,
        capabilities = cmp_lsp_capabilities,
        settings = {
            ["rust-analyzer"] = {
                procMacro = {
                    enable = true
                }
            }
        }
    }, -- rust-analyer options
}

require('rust-tools').setup(rust_tools_opts)

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- Declare the following environment variable in order to use this
local sumneko_root_path = vim.env.SUMNEKO_LUA_ROOT_PATH
if sumneko_root_path ~= nil then
    local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

    require'lspconfig'.sumneko_lua.setup {
      cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = vim.split(package.path, ';'),
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
      on_attach = on_attach
    }

end

require("crates").setup {
    avoid_prerelease = true, -- don't select a prerelease if the requirement does not have a suffix
    autoload = true, -- automatically run update when opening a Cargo.toml
    autoupdate = true, -- atomatically update when editing text
    loading_indicator = true, -- show a loading indicator while fetching crate versions
    text = {
        loading    = "   Loading",
        version    = "   %s",
        prerelease = "   %s",
        yanked     = "   %s",
        nomatch    = "   No match",
        upgrade    = "   %s",
        error      = "   Error fetching crate",
    },
    highlight = {
        loading    = "CratesNvimLoading",
        version    = "CratesNvimVersion",
        prerelease = "CratesNvimPreRelease",
        yanked     = "CratesNvimYanked",
        nomatch    = "CratesNvimNoMatch",
        upgrade    = "CratesNvimUpgrade",
        error      = "CratesNvimError",
    },
    popup = {
        autofocus = false, -- focus the versions popup when opening it
        copy_register = '"', -- the register into which the version will be copied
        style = "minimal", -- same as nvim_open_win opts.style
        border = "none", -- same as nvim_open_win opts.border
        max_height = 30,
        min_width = 20,
        text = {
            title   = "  %s ",
            version = "   %s ",
            yanked  = "  %s ",
        },
        highlight = {
            title   = "CratesNvimPopupTitle",
            version = "CratesNvimPopupVersion",
            yanked  = "CratesNvimPopupYanked",
        },
        keys = {
            hide = { "q", "<esc>" },
            select = { "<cr>" },
            copy_value = { "yy" },
        },
    },
}

vim.opt.termguicolors = true
require'nvim-tree'.setup {}
require'nvim-nonicons'
require'feline'.setup {}
require("bufferline").setup{}
