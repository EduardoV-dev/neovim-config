local null_ls = require "null-ls"

--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below
--
-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
    -- set vim options here (vim.<first_key>.<second_key> = value)
    options = {
        opt = {
            shiftwidth = 4, -- Number of space inserted for indentation
            tabstop = 4, -- Number of space in a tab
        },
    },

    -- Set colorscheme to use
    colorscheme = "ayu-mirage",

    -- Extend LSP configuration
    lsp = {
        formatting = {
            timeout_ms = 2000, -- default format timeout
        },
    },

    -- Mapping data with "desc" stored directly by vim.keymap.set().
    --
    -- Please use this mappings table to set keyboard mapping since this is the
    -- lower level configuration and more robust one. (which-key will
    -- automatically pick-up stored data by this setting.)
    mappings = {
        -- first key is the mode
        i = {
            ["kj"] = { "<esc>", desc = "Exit insert mode" },
            -- setting a mapping to false will disable it
            ["jj"] = false,
            ["jk"] = false,
            ["<C-h>"] = { "<C-W>", desc = "Simulate Ctrl + Backspace" }, -- <C-h> is the same as Ctrl+<BS>
            ["<C-Del>"] = { "<C-o>dw", desc = "Simulate Ctrl + Del" }
        },
        n = {
            ["q"] = false, -- Disables the record mode in vim
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
            ["Shatur/neovim-ayu"] = {},
        },
        -- All other entries override the require("<key>").setup({...}) call for default plugins
        ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
            -- config variable is the default configuration table for the setup function call
            -- local null_ls = require "null-ls"

            -- Check supported formatters and linters
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
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
