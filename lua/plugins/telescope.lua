return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files({
          hidden = true, -- Enable searching for hidden files
        })
      end, {})
      vim.keymap.set("n", "<leader>fg", function()
        builtin.live_grep({
          additional_args = function(opts)
            return { "--hidden" } -- Enable searching hidden files with live_grep
          end,
        })
      end, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
      vim.keymap.set("n", "<leader>en", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
          hidden = true, -- Enable searching for hidden files in config directory
        })
      end)
    end,
  },
}
