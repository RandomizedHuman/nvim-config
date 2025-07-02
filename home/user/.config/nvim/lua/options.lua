vim.g.mapleader = ' '
local opt = vim.opt
opt.clipboard = 'unnamedplus'

opt.mouse = 'a'

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.number = true
opt.relativenumber = true
opt.cursorline = true

opt.incsearch = true
opt.hlsearch = false

opt.splitbelow = true
opt.splitright = true

vim.o.guicursor = 'a:ver5'

vim.cmd('colorscheme retrowave')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files hidden=true<cr>", { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', function() builtin.live_grep({ additional_args = { '-u' } }) end, { desc = 'Telescope live grep'})
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


require('nvim-treesitter').setup {
	ensure_installed = {"c", "lua", "rust"},
	auto_install = true,

highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

