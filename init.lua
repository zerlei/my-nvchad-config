-- local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
--
-- table.print = print_r
-- print("current postions:")
if vim.g.nvchad_theme then
    -- print("In nvchad")
else
    -- print("not in nvchad")
    -- must in lua subdir if not won't require success
    local mappings = require "mappings"

    for mode, mode_values in pairs(mappings.general) do
        for keybind, mapping_info in pairs(mode_values) do
            -- print(mode, keybind, mapping_info[1], mapping_info.opts or {})
            vim.keymap.set(mode, keybind, mapping_info[1], mapping_info.opts or {})
        end
    end
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
    vim.opt.number = true
end

-- if set no, vim will change file's birthtime...
vim.opt.backupcopy = "yes"

-- vim.inspect for view a table

-- print(vim.inspect(vim.g.nvchad_theme))
