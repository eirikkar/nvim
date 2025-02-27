return {
  {
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup({
        vim.cmd.colorscheme("vague"),
        transparent = true,
        style = {
          -- "none" is the same thing as default. But "italic" and "bold" are also valid options
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

          -- keywords
          keywords = "none",
          keyword_return = "none",
          keywords_loop = "none",
          keywords_label = "none",
          keywords_exception = "none",

          -- builtin
          builtin_constants = "none",
          builtin_functions = "none",
          builtin_types = "none",
          builtin_variables = "none",
        },
      })
    end,
  },
}
