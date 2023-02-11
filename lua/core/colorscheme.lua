-- set colorscheme to ~nightfly~zephyr with protected call
-- in case it isn't installed
local status, cat = pcall(require, "catppuccin")
if not status then
    print("Colorscheme not found!") -- print error if colorscheme not installed
    return
end

--[[
tn.setup({
  style = "storm",
  dim_inactive = true,
  lualine_bold = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
  },
})
]]


-- check https://github.com/catppuccin/nvim#special-integrations for more configuration
-- some copied from https://github.com/nullchilly/CatNvim/blob/33f8c15bb44a61ce35617675c7bdc44fed625621/lua/plugins/colorscheme.lua

cat.setup({
    flavor = "mocha", -- latte, frappe, macchiato, mocha
    term_colors = true,
    transparent_background = false,
    no_italic = true,
    no_bold = false,
    styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = { "bold"},
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
    highlight_overrides = {
        mocha = function (C)
            return {
                TabLineSel = { bg = C.pink },
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
        treesitter_context = false,
        nvimtree = true,
        markdown = true,
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
})

vim.cmd.colorscheme "catppuccin-mocha"

