return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,

    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "omnisharp" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
			lspconfig.omnisharp.setup({
				capabilities = capabilities,
				enable_roslyn_analysers = true,
				enable_import_completion = true,
				organize_imports_on_format = true,
				enable_decompilation_support = true,
				filetypes = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props', 'csx', 'targets' }
			})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
	{
		'nvimtools/none-ls.nvim',
		-- event = { "BufReadPre", "BufNewFile" },
		lazy = true,
		-- event = "VeryLazy",
		config = function()
			local null_ls = require('null-ls')
			null_ls.setup({
				sources = {
					-- null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.csharpier,
					null_ls.builtins.formatting.yamlfmt,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
				}
			})
			vim.keymap.set('n', '<leader>lff', function() vim.lsp.buf.format({ async = true }) end,
				{ desc = "Format document" })
			vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = "Rename Symbol" })
			vim.keymap.set({ 'n', 'i' }, '<f2>', vim.lsp.buf.rename, { desc = "Rename Symbol" })
			vim.keymap.set({ 'n', 'i' }, '<f12>', vim.lsp.buf.definition, { desc = "Go to Definition" })
			vim.keymap.set({ 'n' }, '<leader>ld', vim.lsp.buf.definition, { desc = "Go to Definition" })
			vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, { desc = "Go to Implementation" })
			vim.keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help, { desc = "Signature Help" })
			vim.keymap.set('n', '<leader>lsR', vim.lsp.buf.references, { desc = "To to References" })
			-- vim.keymap.set({ 'n' }, '<leader>lsD', ":Trouble document_diagnostics<CR>", { desc = "Toggle Document Diagnostics" })
			vim.keymap.set({ 'n' }, '<leader>lsD', ":Trouble diagnostics<CR>", { desc = "Toggle Document Diagnostics" })
			vim.keymap.set('n', '<leader>lsI', ':Trouble lsp_implementations<CR>',
				{ desc = "Toggle LSP References" })
			vim.keymap.set('n', '<leader>lsd', ":Trouble lsp_definitions<CR>", { desc = "Toggle LSP Definitions" })
		end
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		-- event = { 'VeryLazy' },
		-- enabled = false,
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
			-- "neovim/nvim-lspconfig"
		},
		config = function()
			require('mason-null-ls').setup({
				automatic_setup = true
			})
		end,
	}
}
