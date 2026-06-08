-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for

-- for markdown-preview server
vim.g.mkdp_browser = "brave"

-- Disable diagnostics on startup
vim.diagnostic.enable(false)

-- This enables Mermaid and other diagrams in the browser preview
vim.g.mkdp_preview_options = {
    mmarkdown = {
        mermaid = {
            theme = "dark", -- You can use "default", "dark", or "forest"
        },
    },
}
