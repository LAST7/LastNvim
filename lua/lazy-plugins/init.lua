return {
    "nvim-lua/plenary.nvim", -- lua functions that many plugins use

    {
        "catppuccin/nvim",
        name = "catppuccin"
    },

    "christoomey/vim-tmux-navigator", -- tmux & split window navigation

    "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

    -- file explorer
    "nvim-tree/nvim-tree.lua",

    -- vs-code like icons
    "nvim-tree/nvim-web-devicons",

    -- statusline
    "nvim-lualine/lualine.nvim",

    -- autocompletion
    "hrsh7th/nvim-cmp", -- completion plugin
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths

    -- snippets
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets

    -- managing & installing lsp servers, linters & formatters
    "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
    "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

    -- configuring lsp servers
    "neovim/nvim-lspconfig", -- easily configure language servers
    "hrsh7th/cmp-nvim-lsp", -- for autocompletion
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup({})
        end,
    }, -- enhanced lsp uis
    "folke/trouble.nvim", -- , dependencies = "kyazdani42/nvim-web-devicons" },
    "jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
    "onsails/lspkind.nvim", -- vs-code like icons for autocompletion

    -- formatting & linting
    "jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
    "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

    -- treesitter configuration
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        dependencies = {
            "windwp/nvim-ts-autotag"
        },
    },

    -- auto closing
    "windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

    -- jdtls
    "mfussenegger/nvim-jdtls",

    -- bufferline
    {
        "akinsho/bufferline.nvim",
        -- dependencies = "catppuccin",
        version = "v3.*",
        -- dependencies = 'nvim-tree/nvim-web-devicons'
    },

}
