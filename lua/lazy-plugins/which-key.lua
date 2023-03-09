return {
    "folke/which-key.nvim",
    config = function ()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
            -- configurations are at https://github.com/folke/which-key.nvim
        }
    end
}
