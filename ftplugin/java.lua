local jdtls = require("jdtls")

-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = "/home/last/.local/share/nvim/jdt-language-server/workspace/" .. project_name

<<<<<<< HEAD
-- Source: https://sookocheff.com/post/vim/neovim-java-ide/
-- The on_attach function is used to set key maps after the language server
-- attaches to the current buffer
local on_attach = function (client, bufnr)
    -- Regular Neovim Lsp client keymappings
    local keymap = vim.keymap
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", bufopts) -- show definition, references
    keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", bufopts) -- got to declaration
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", bufopts) -- see definition and make edits in window
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufopts) -- go to implementation
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts) -- see available code actions
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufopts) -- smart rename
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts) -- show  diagnostics for line
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts) -- show diagnostics for cursor
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts) -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts) -- jump to next diagnostic in buffer
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts) -- show documentation for what is under cursor
    keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", bufopts) -- see outline on right hand side
    keymap.set("n", "<leader>tt", "<cmd>Lspsaga term_toggle<CR>", bufopts) -- see outline on right hand side

    -- Java extensions provided by jdtls
    keymap.set("<C-o>", jdtls.organize_imports, bufopts) -- Organize imports
    -- keymap.set("<space>ev", jdtls.extract_variable, bufopts) -- Extract variable
    -- keymap.set("<space>ec", jdtls.extract_constant, bufopts) -- Extract constant

end

=======
>>>>>>> 2362fa4a54367347ff4f17a4975c94668024b60c
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
<<<<<<< HEAD
    on_attach = on_attach,
=======
>>>>>>> 2362fa4a54367347ff4f17a4975c94668024b60c
    cmd = {

        -- ~💀~
        "java", -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        -- ~💀~
        "-jar",
        "/home/last/.local/share/nvim/jdt-language-server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
        -- Must point to the                                                     Change this to
        -- eclipse.jdt.ls installation                                           the actual version

        -- ~💀~
        "-configuration",
        "/home/last/.local/share/nvim/jdt-language-server/config_linux/",
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
        -- Must point to the                      Change to one of `linux`, `win` or `mac`
        -- eclipse.jdt.ls installation            Depending on your system.

        -- 💀
        -- See `data directory configuration` section in the README
        "-data",
        workspace_dir,
    },

    -- 💀
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {},
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        bundles = {},
    },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)
<<<<<<< HEAD
=======

-- I have no idea why things down below wont work.
-- source: https://blog.csdn.net/lxyoucan/article/details/123448313

--[[
local current_buff = vim.api.nvim_get_current_buf
-- after the lsp is attatched to the current buffer
-- set mappings with the `on_attatch` function

local java_on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings
    local opts = { noremap = true, silent = true }
    -- See `:help vim.lsp.*` for documentation on any of the following functions
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    -- rename
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
end

java_on_attach(nil, current_buff)
]]
>>>>>>> 2362fa4a54367347ff4f17a4975c94668024b60c
