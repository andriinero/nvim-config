-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keep accidental presses of q from recording macros; use <leader>mr instead.
vim.keymap.set("n", "q", "<Nop>", { desc = "Disable macro recording" })
vim.keymap.set("n", "<leader>mr", "q", { desc = "Record Macro" })

-- Removes line swap mappings on alt hold
for _, mode in ipairs({ "n", "i", "v" }) do
  pcall(vim.keymap.del, mode, "<A-j>")
  pcall(vim.keymap.del, mode, "<A-k>")
end

-- Ctrl Up and Down
vim.keymap.set("n", "<esc>d", "<C-d>", { remap = true })
vim.keymap.set("n", "<esc>u", "<C-u>", { remap = true })
