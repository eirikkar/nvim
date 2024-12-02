vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd hCR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.lsp.inlay_hint.enable()
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>s' , ':w<CR>')
vim.keymap.set('n', '<leader>r' , ':%s/')
vim.wo.number = true
vim.wo.relativenumber = true