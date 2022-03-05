vim.g.mapleader = " "

vim.opt.syntax = "enable"

vim.opt.wrap = false
vim.opt.hidden = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.ruler = true
vim.opt.cmdheight = 2
vim.opt.iskeyword:append("-")
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.conceallevel = 0
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.background = "dark"
vim.opt.showtabline = 2
vim.opt.numberwidth = 4
vim.opt.scrolloff = 4
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.formatoptions:remove("cron")
vim.opt.clipboard = "unnamedplus"
vim.opt.autochdir = true
vim.opt.termguicolors = true
vim.opt.textwidth = 80
vim.colorcolumn = "80"

vim.opt.completeopt = "menuone,noinsert,noselect"

vim.opt.shortmess:append("c")

vim.cmd [[
try
  colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
