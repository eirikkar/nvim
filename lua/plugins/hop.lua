return {
  'smoka7/hop.nvim',
  version = "*",
  opts = {
    keys = 'etovxqpdygfblzhckisuran'
  },
  config = function()
    require('hop').setup()
    vim.keymap.set('', 'f', ':HopWord<CR>')
    vim.keymap.set('', 'F', ':HopChar2<CR>')
    vim.keymap.set('', 't', ':HopLineStart<CR>')
    vim.keymap.set('', 'T', ':HopPattern<CR>')
 end
}
