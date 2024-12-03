return {
  'smoka7/hop.nvim',
  version = "*",
  opts = {
    keys = 'etovxqpdygfblzhckisuran'
  },
  config = function()
    require('hop').setup()
    vim.keymap.set('', '<leader>f', ':HopWord<CR>')
    vim.keymap.set('', '<leader>t', ':HopChar2<CR>')
    vim.keymap.set('', '<leader>F', ':HopLineStart<CR>')
    vim.keymap.set('', '<leader>w', ':HopPattern<CR>')
 end
}
