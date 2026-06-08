return {
    "gaoDean/autolist.nvim",
    ft = {
        "markdown",
        "text",
        "tex",
        "plaintex",
        "norg",
    },
    config = function()
        require("autolist").setup()
        -- Add any custom mappings here, for example:
        vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", "O", "O<cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", "<TAB>", "<cmd>AutolistTab<cr>")
        vim.keymap.set("n", "<S-TAB>", "<cmd>AutolistShiftTab<cr>")
        vim.keymap.set("i", "<TAB>", "<cmd>AutolistTab<cr>")
        vim.keymap.set("i", "<S-TAB>", "<cmd>AutolistShiftTab<cr>")
        vim.keymap.set("n", "dd", "<cmd>AutolistRecalculate<cr>dd")
    end,
}
