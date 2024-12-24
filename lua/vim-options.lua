vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.fillchars = { eob = " " }
vim.g.mapleader = " "
vim.g.background = "light"
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.lsp.inlay_hint.enable()
vim.wo.number = true
vim.wo.relativenumber = true

-- keybindings
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd hCR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>s", ":w<CR>")
vim.keymap.set("n", "<leader>r", ":%s/")
vim.keymap.set("n", "<c-n>", ":Oil --float<CR>")
vim.keymap.set("n", "<leader>m", ":CodeCompanionChat Toggle<CR>")
vim.api.nvim_set_keymap("n", "<PageUp>", "<c-u>", { noremap = true })
vim.api.nvim_set_keymap("n", "<PageDown>", "<c-d>", { noremap = true })

vim.diagnostic.config({ virtual_text = false })
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
