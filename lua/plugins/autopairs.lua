local config = {
    check_ts = true, -- enable treesitter
    ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
        java = false, -- don't check treesitter on java
    },
}

return {
    "windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
    dependencies = {
        "nvim-cmp",
    },
    event = "VeryLazy",
    config = function ()
        require("nvim-autopairs").setup(config)

        -- make autopairs and completion work together
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end
}
