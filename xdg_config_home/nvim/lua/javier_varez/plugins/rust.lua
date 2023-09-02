return {
    {
        'simrat39/rust-tools.nvim',
        init = function()
            -- Rust tools
            local rust_on_attach = function(a, bufnr)
                on_attach(a, bufnr)

                -- Rust specific mappings.
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

                local opts = { noremap=true, silent=true }

                buf_set_keymap('n', 'K', '<Cmd>lua require("rust-tools.hover_actions").hover_actions()<CR>', opts)
                buf_set_keymap('n', '<space>rr', '<Cmd>lua require("rust-tools.runnables").runnables()<CR>', opts)
                buf_set_keymap('n', '<space>rc', '<Cmd>lua require("rust-tools.open_cargo_toml").open_cargo_toml()<CR>', opts)
            end

            local rust_analyzer_bin = ''
            require'plenary.job':new({
                command = 'rustup',
                args = { 'which', 'rust-analyzer' },
                on_stdout = function(error, data)
                    rust_analyzer_bin = data
                end,
            }):sync()

            if rust_analyzer_bin == nil or rust_analyzer_bin == '' then
                print("Please install Rust Analyzer with rustup. Assuming rust_analyzer binary is in path.")
                rust_analyzer_bin = 'rust_analyzer'
            end

            local rust_tools_opts = {
                tools = { -- rust-tools options
                    -- Automatically set inlay hints (type hints)
                    autoSetHints = true,

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
                    cmd = { rust_analyzer_bin },
                    on_attach = rust_on_attach,
                    capabilities = cmp_lsp_capabilities,
                    settings = {
                        ["rust-analyzer"] = {
                            imports = {
                                granularity = {
                                    group = "module",
                                },
                                prefix = "self",
                            },
                            cargo = {
                                buildScripts = {
                                    enable = true,
                                },
                            },
                            procMacro = {
                                enable = true
                            }
                        }
                    }
                }, -- rust-analyer options
            }

            require('rust-tools').setup(rust_tools_opts)
        end
    }
}
