local config = {}

return {
    "folke/noice.nvim",
    config = function ()
        require("noice").setup(config)
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}
