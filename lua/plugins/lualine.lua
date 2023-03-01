-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
    return
end

--[[
-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.nightfly")

-- new colors for theme
local new_colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
  uiuc_blue = "#13294B",
  uiuc_orange = "#E84A27",
}

-- change nightlfy theme colors
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.uiuc_orange
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
  a = {
    gui = "bold",
    bg = new_colors.yellow,
    fg = new_colors.black, -- black
  },
}
]]

local lualine_palenight = require("lualine.themes.palenight")

-- go to https://github.com/nvim-lualine/lualine.nvim
local config = {
    options = {
        icons_enabled = true,
        theme = lualine_palenight,
        component_separators = { left = ')', right = '(' },
        section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        -- section_separators = '|',
    },
    sections = {
        lualine_c = {"filename"},
    }
}

local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

ins_left {
    -- Lsp server name
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()

        if next(clients) == nil then
            return msg
        end

        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = { fg = '#ffffff', gui = 'bold' }
}


lualine.setup(config)
