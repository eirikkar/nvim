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
			ensure_installed = {
				"omnisharp",
				"lua_ls",
				"ts_ls",
				"eslint",
				"html",
				"cssls",
				"pyright",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		lazy = false,
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")
			local mason_registry = require("mason-registry")

			-- Retrieve the Omnisharp executable path
			local omnisharp_pkg = mason_registry.get_package("omnisharp")
			local omnisharp_path = omnisharp_pkg:get_install_path() .. "/omnisharp"

			-- Configure Omnisharp
			lspconfig.omnisharp.setup({
				cmd = { omnisharp_path, "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			-- Configure bash-language-server
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})

			-- Configure lua_ls
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.eslint.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			-- Autoformat on save
			-- vim.api.nvim_create_autocmd("LspAttach", {
			--     group = vim.api.nvim_create_augroup("lsp", { clear = true }),
			--     callback = function(args)
			--         vim.api.nvim_create_autocmd("BufWritePre", {
			--             buffer = args.buf,
			--             callback = function()
			--                 vim.lsp.buf.format({ async = false, id = args.data.client_id })
			--             end,
			--         })
			--     end,
			-- })

			-- Key mappings
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
