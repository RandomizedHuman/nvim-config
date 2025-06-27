local opt = vim.opt

opt.clipboard = 'unnamedplus'

opt.mouse = 'a'

opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

opt.number = true
opt.relativenumber = true
opt.cursorline = true

opt.incsearch = true
opt.hlsearch = false

opt.splitbelow = true
opt.splitright = true

vim.o.guicursor = 'a:ver5'

vim.cmd('colorscheme retrowave')
