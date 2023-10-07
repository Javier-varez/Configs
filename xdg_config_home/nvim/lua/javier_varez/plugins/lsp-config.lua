return {
    {
        'neovim/nvim-lspconfig',
        init = function()
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

            local cmp_lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

            local servers = {
                jedi_language_server = {},
                gopls = {},
                clangd = {
                    cmd = { "clangd", "--query-driver=*/**" },
                },
                ltex = {
                    settings = {
                        ltex = {
                            language = "en-US",
                            languageToolHttpServerUri = "http://localhost:8875/",
                        },
                    },
                },
            }


            for lsp, cfg in pairs(servers) do
                local defcfg = {
                    -- default config. overriden by the server
                    on_attach = on_attach,
                    capabilities = cmp_lsp_capabilities
                }

                for k, v in pairs(cfg) do
                    defcfg[k] = v
                end

                nvim_lsp[lsp].setup(defcfg)
            end
        end
    },
}
