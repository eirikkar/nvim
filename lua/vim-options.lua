vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.fillchars = { eob = " " }
vim.g.mapleader = " "
vim.g.background = "light"
vim.opt.swapfile = false
vim.lsp.inlay_hint.enable()
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.clipboard = "unnamedplus"

-- keybindings
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
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
vim.api.nvim_set_keymap(
  "n",
  "<c-n>",
  [[<cmd>lua require("oil").toggle_float()<CR>]],
  { noremap = true, silent = true, desc = "Toggle Oil float" }
)
vim.keymap.set("n", "<leader>m", ":CodeCompanionChat Toggle<CR>")
vim.api.nvim_set_keymap("n", "<PageUp>", "<c-u>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<PageDown>", "<c-d>zz", { noremap = true })

vim.diagnostic.config({ virtual_text = false })
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
