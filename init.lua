-- Note:  when disabled nvim mouse press shift when use mouse, this help when copy and paste by using ssh.
-- windows:  press shfit and mouse right click, paster from system, pressing shift mouse select text and <C-c> copy from current text
--
-- print("current postions:")
if vim.g.nvchad_theme then
  -- print("In nvchad")
else
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
  vim.opt.number = true
  -- print("not in nvchad")
  -- must in lua subdir if not won't require success
  local old_path = package.path
  package.path = "./lua/custom/lua/?.lua;" .. "./lua/?.lua;" .. package.path

  local mappings = require "mappings"
  package.path = old_path
  for mode, mode_values in pairs(mappings.general) do
    for keybind, mapping_info in pairs(mode_values) do
      -- print(mode, keybind, mapping_info[1], mapping_info.opts or {})
      vim.keymap.set(mode, keybind, mapping_info[1], mapping_info.opts or {})
    end
  end
end
-- if set no, vim will change file's birthtime...
vim.opt.backupcopy = "yes"

-- vim.opt.mouse = "nvi"
-- vim.opt.mousemodel = "extend"
-- vim.inspect for view a table
-- Note vim.inspect print a table in lua
-- print(vim.inspect(vim.g.nvchad_theme))
