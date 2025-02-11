return {
  {
    "echasnovski/mini.pairs",
    version = "*",
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
    config = function()
      require("mini.pairs").setup()
    end,
  },
}
