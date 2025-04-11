return {
  {
    "vague2k/vague.nvim",
    config = function()
      -- Enable true color support
      vim.o.termguicolors = true

      -- Setup vague.nvim
      require("vague").setup({
        transparent = true,
        style = {
          boolean = "bold",
          number = "bold",
          float = "none",
          error = "bold",
          comments = "italic",
          conditionals = "none",
          functions = "bold",
          headings = "bold",
          operators = "none",
          strings = "italic",
          variables = "none",
          keywords = "none",
          keyword_return = "none",
          keywords_loop = "none",
          keywords_label = "none",
          keywords_exception = "none",
          builtin_constants = "none",
          builtin_functions = "none",
          builtin_types = "none",
          builtin_variables = "none",
        },
        colors = {
          bg = "none",
          fg = "#d4be98",
          floatBorder = "#878787",
          line = "#252530",
          comment = "#606079",
          builtin = "#b4d4cf",
          func = "#c48282",
          string = "#e8b589",
          number = "#e0a363",
          property = "#c3c3d5",
          constant = "#aeaed1",
          parameter = "#bb9dbd",
          visual = "#333738",
          error = "#df6882",
          warning = "#f3be7c",
          hint = "#7e98e8",
          operator = "#90a0b5",
          keyword = "#6e94b2",
          type = "#9bb4bc",
          search = "#405065",
          plus = "#8cb66d",
          delta = "#f3be7c",
        },
      })

      -- Apply the vague colorscheme
      vim.cmd("colorscheme vague")

      -- Force a transparent background for Normal and NormalFloat
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
      })
    end,
  },
}
