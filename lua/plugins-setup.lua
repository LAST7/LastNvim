-- installation of lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- local opts = {}

require("lazy").setup("lazy-plugins")

-- load essential plugins
require("plugins.nvim-tree")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.nvim-cmp")
require("plugins.autopairs")
require("plugins.treesitter")
require("plugins.bufferline")


require("plugins.lsp.mason")
require("plugins.lsp.lspconfig")
require("plugins.lsp.null-ls")
require("plugins.lsp.trouble")
