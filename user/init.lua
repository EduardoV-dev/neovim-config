local null_ls = require "null-ls"

--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below
--
local config = {
    -- set vim options here (vim.<first_key>.<second_key> = value)
    options = {
        opt = {
            shiftwidth = 4, -- Number of space inserted for indentation
            tabstop = 4, -- Number of space in a tab
        },
    },

    colorscheme = "ayu-mirage", -- Set colorscheme to use

    -- Extend LSP configuration
    lsp = {
        formatting = {
            timeout_ms = 2000, -- format timeout
        },
    },

    mappings = {
        -- first key is the mode
        i = {
            ["kj"] = { "<esc>", desc = "Exit insert mode" },
            ["jj"] = false,
            -- setting a mapping to false will disable it
            ["jk"] = false,
            ["<C-h>"] = { "<C-W>", desc = "Simulate Ctrl + Backspace" }, -- <C-h> is the same as Ctrl+<BS>
            ["<C-Del>"] = { "<C-o>dw", desc = "Simulate Ctrl + Del" }
        },
        n = {
            ["q"] = false, -- Disables the record mode in vim
            ["<leader>vs"] = { "<cmd>vsplit", desc = "Virtual split" }, -- Creates a virtual split for a selected file
        },
        t = {
            ["kj"] = { "<C-\\><C-n>", desc = "Exit terminal insert mode" }
        },
        v = {
            ["q"] = false, -- Disables the record mode in vim
        }
    },

    -- Configure plugins
    plugins = {
        init = {
            ["Shatur/neovim-ayu"] = {}, -- For theming with ayu.
            ["tpope/vim-fugitive"] = {}, -- Git commands via nvim command mode.
            ["tpope/vim-surround"] = {}, -- It is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
            ["mg979/vim-visual-multi"] = {} -- Multi cursors in vim
        },
        -- All other entries override the require("<key>").setup({...}) call for default plugins
        ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
            config.sources = {
                -- Set a formatter
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier.with({ extra_args = {
                    "--allow-parens=always",
                    "--bracket-same-line",
                    "--bracket-spacing",
                    "--end-of-line=auto",
                    "--no-jsx-single-quote",
                    "--no-single-attribute-per-line",
                    "--print-width=80",
                    "--semi",
                    "--single-quote",
                    "--tab-width=4",
                    "--trailing-comma=all",
                } }),
            }

            return config -- return final config table
        end,
    },
}

return config
