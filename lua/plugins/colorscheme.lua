return {
    {
        "dgox16/oldworld.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("oldworld").setup({
                vim.cmd.colorscheme("oldworld"),
                variant = "oled",
                styles = {
                    booleans = { italic = true, bold = true },
                },
                integrations = {
                    hop = true,
                    telescope = true,
                },
                highlight_overrides = {
                    Comment = { bg = "#ff0000" },
                },
            })
        end,
    },
}
