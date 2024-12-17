return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = true,
        keymap = {
          accept = false, -- handled by nvim-cmp / blink.cmp
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.3",
      },
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
      "windwp/nvim-ts-autotag",
      "windwp/nvim-autopairs",
    },
    config = function()
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      require("nvim-autopairs").setup()

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        completion = { completeopt = "menu,menuone,noinsert" },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item {behavior = cmp.SelectBehavior.Insert}, -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item {behavior = cmp.SelectBehavior.Insert},-- next suggestion
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),      -- scroll up preview
          ["<C-d>"] = cmp.mapping.scroll_docs(4),       -- scroll down preview
          ["<C-Space>"] = cmp.mapping.complete({}),     -- show completion suggestions
          ["<C-c>"] = cmp.mapping.abort(),              -- close completion window
          ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- select suggestion
        }),
        sources = cmp.config.sources({
          { name = "copilot",                group_index = 2 },
          { name = "nvim_lsp",               group_index = 1 }, -- lsp
          { name = "buffer",                 max_item_count = 5, group_index = 2 }, -- text within current buffer
          { name = "path",                   max_item_count = 3, group_index = 3 }, -- file system paths
          { name = "luasnip",                max_item_count = 3, group_index = 5 }, -- snippets
          { name = "nvim-lsp-signature-help" },
        }),
        formatting = {
          expandable_indicator = true,
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            menu = {
              nvim_lsp = "[LSP]",
              buffer = "[Buffer]",
              path = "[PATH]",
              luasnip = "[LuaSnip]",
              Copilot = "",
            },
          }),
        },
        experimental = {
          ghost_text = true,
        },
      })
    end,
  },
}
