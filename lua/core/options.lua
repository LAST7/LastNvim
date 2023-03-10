local opt = vim.opt -- for conciseness

-- line numbers
opt.number = true -- shows absolute line number on cursor line
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight cursorline

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

-- UTF-8
opt.fileencoding = "UTF-8"
vim.g.encoding = "UTF-8"

-- remain lines around the cursor
opt.scrolloff = 8
opt.sidescrolloff = 8

-- show invisible characters
opt.list = true
opt.listchars = "space:·,tab:^I"

-- enhance the completion function
opt.wildmenu = true

-- wait for mappings
opt.timeout = true
opt.timeoutlen = 300

-- apply search when typing
opt.incsearch = true

-- mouse support
opt.mouse = "a"

-- the reference line on the right side
opt.colorcolumn = "90"
