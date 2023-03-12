-- check https://github.com/catppuccin/nvim#special-integrations for more configuration
-- some copied from https://github.com/nullchilly/CatNvim/blob/33f8c15bb44a61ce35617675c7bdc44fed625621/lua/plugins/colorscheme.lua
local config = {
    flavor = "mocha", -- latte, frappe, macchiato, mocha
    term_colors = true,
    transparent_background = false,
    no_italic = false,
    no_bold = false,
    styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = { "bold" },
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "bold" },
        properties = {},
        types = { "bold" },
    },
    --[[
    color_overrides = {
        mocha = {}
    },
    ]]
    custom_highlight = {},
    -- TODO how to make things down below work?
    highlight_overrides = {
        mocha = function (C)
            return {
                TabLineSel = { bg = C.pink },
                indicator_selected = {
                    fg = '#F7CAB8',
                    bg = '#1E2430',
                    sp = '#FF80A0',
                    bold = true,
                    underdouble = true,
                    underline = true,
                },
                CmpBorder = { fg = C.surface2 },
                Pmenu = { bg = C.none },
                TelescopeBorder = { link = "FloatBorder" },
            }
        end,
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        hop = true,
        telescope = true,
        treesitter_context = true,
        nvimtree = true,
        markdown = true,
        lsp_trouble = true,
        mason = true,
        native_lsp = {
            enable = true,
            virtual_text = {
                errors = { "bold" },
                hints = { "italic" },
                warnings = {},
                information = {},
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        }
    },
}

return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function ()
        require("catppuccin").setup(config)
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}
