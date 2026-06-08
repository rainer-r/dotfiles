-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete empty lines within a visual selection
-- This uses 'gv' to keep the selection context for the global command
vim.keymap.set("v", "<leader>de", ":g/^$/d<CR><esc>", { desc = "Delete empty lines in selection" })

-- List Management

-- Convert lines in visual selection to a bulleted list
-- The <gv> keeps the selection active so the substitution applies correctly
vim.keymap.set("v", "<leader>bl", ":s/^/- /<CR>:noh<CR><esc>", { desc = "Convert selection to bullets" })

-- Convert selection to a numbered list and clear highlights
vim.keymap.set(
    "v",
    "<leader>nl",
    [[:s/^\s*/\=line('.') - line("'<") + 1 . ". " /<CR>:noh<CR><esc>]],
    { desc = "Numbered list" }
)

-- Turn numbered list into bullets (Visual Mode only)
vim.keymap.set("v", "<leader>nb", ":s/\\d\\+\\./-/<CR><cmd>noh<CR><esc>", { desc = "Convert numbers to bullets" })

-- Convert bullets into a numbered list (Visual Mode only)
vim.keymap.set(
    "v",
    "<leader>bn",
    [[:s/^\(\s*\)[-*]\s*/\=submatch(1) . (line('.') - line("'<") + 1) . ". "/<CR><cmd>noh<CR><esc>]],
    { desc = "Convert bullets to numbers" }
)

-- Keymap to convert CSV selection to OLTP Table
vim.keymap.set("v", "<leader>tm", function()
    -- 1. Get the range of the visual selection
    local start_row = vim.fn.line("v")
    local end_row = vim.fn.line(".")

    -- Ensure start_row is the smaller number (for selections made bottom-to-top)
    if start_row > end_row then
        start_row, end_row = end_row, start_row
    end

    -- 2. Grab the lines
    local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
    local new_lines = {}

    for i, line in ipairs(lines) do
        -- Split by comma and trim whitespace
        local columns = vim.split(line, ",")
        for j, col in ipairs(columns) do
            columns[j] = vim.trim(col)
        end

        -- Format as Markdown row
        table.insert(new_lines, "| " .. table.concat(columns, " | ") .. " |")

        -- 3. If it's the first line (header), add the separator row
        if i == 1 then
            local separators = {}
            for _ = 1, #columns do
                table.insert(separators, "---")
            end
            table.insert(new_lines, "| " .. table.concat(separators, " | ") .. " |")
        end
    end

    -- 4. Replace the original text with the new table
    vim.api.nvim_buf_set_lines(0, start_row - 1, end_row, false, new_lines)
end, { desc = "Convert CSV selection to Markdown Table" })

-- Keymap to convert CSV selection to OLAP Table
vim.keymap.set("v", "<leader>th", function()
    local start_row = vim.fn.line("v")
    local end_row = vim.fn.line(".")
    if start_row > end_row then
        start_row, end_row = end_row, start_row
    end

    local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
    local new_lines = {}

    -- Create the dummy header based on number of columns in the first line
    local first_line_cols = vim.split(lines[1], ",")
    local header = "|"
    local separator = "|"
    for _ = 1, #first_line_cols do
        header = header .. " |"
        separator = separator .. " --- |"
    end
    table.insert(new_lines, header)
    table.insert(new_lines, separator)

    -- Process the actual data lines
    for _, line in ipairs(lines) do
        local columns = vim.split(line, ",")
        for j, col in ipairs(columns) do
            columns[j] = vim.trim(col)
        end
        table.insert(new_lines, "| " .. table.concat(columns, " | ") .. " |")
    end

    vim.api.nvim_buf_set_lines(0, start_row - 1, end_row, false, new_lines)
end, { desc = "Convert CSV to Headless Markdown Table" })

-- CSV to Headless Table (No Title)
vim.keymap.set("v", "<leader>th", function()
    local start_row = vim.fn.line("v")
    local end_row = vim.fn.line(".")
    if start_row > end_row then
        start_row, end_row = end_row, start_row
    end

    local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
    local new_lines = {}

    -- 1. Create a dummy header and separator (required for MD to render)
    local first_line_cols = vim.split(lines[1], ",")
    local col_count = #first_line_cols

    local header = "|"
    local separator = "|"
    for _ = 1, col_count do
        header = header .. " |"
        separator = separator .. " :--- |" -- Left align data
    end
    table.insert(new_lines, header)
    table.insert(new_lines, separator)

    -- 2. Process the CSV rows
    for _, line in ipairs(lines) do
        local columns = vim.split(line, ",")
        for j, col in ipairs(columns) do
            columns[j] = vim.trim(col)
            -- Bold the first column (the keys/labels)
            if j == 1 then
                columns[j] = "**" .. columns[j] .. "**"
            end
        end
        table.insert(new_lines, "| " .. table.concat(columns, " | ") .. " |")
    end

    vim.api.nvim_buf_set_lines(0, start_row - 1, end_row, false, new_lines)
end, { desc = "CSV to Headless Markdown Table" })
