-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

-- list of parsers
local parsers = {
        "c",
        "cpp",
        -- "r  fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/srcust",
        "json",
        "java",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "xml",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "python",
        "vim",
        "dockerfile",
        "gitignore",
    }

-- enable the foldmethod
vim.api.nvim_create_autocmd("FileType", {
    pattern = vim.fn.join(parsers, ","),
    -- group = "dotfiles-settings",
    callback = function ()
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr"
        vim.opt_local.foldmethod = "expr"
    end,
    desc = "Set fold method for treesitter",
})

-- get the treesitter parser for xml
-- from https://github.com/windwp/nvim-ts-autotag/issues/79
-- https://github.com/oncomouse/dotfiles/blob/catppuccin/conf/vim/plugin/nvim-treesitter.lua
require("nvim-treesitter.parsers").list.xml = {
    install_info = {
        url = "https://github.com/Trivernis/tree-sitter-xml",
        -- the repository here is forked from https://github.com/dorgnarg/tree-sitter-xml
        files = {"src/parser.c"},
        generate_requires_npm = true,
        branch = "main",
    },
    filetype = "xml",
}

-- configure treesitter
treesitter.setup({
    -- enable syntax highlighting
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    -- enable indentation
    indent = { enable = true, disable = { "python" } },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = { enable = true },
    -- ensure these language parsers are installed
    ensure_installed = parsers,
    -- auto install above language parsers
    auto_install = true,
})
