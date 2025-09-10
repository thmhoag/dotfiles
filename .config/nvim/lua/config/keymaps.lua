
-- custom vim keybindings
vim.keymap.set("n", "<C-q>", ":qa<CR>", { noremap = true, silent = true })

-- save in normal and insert mode
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })

-- save all in normal and insert mode
vim.keymap.set("n", "<C-S-s>", ":wa<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-S-s>", "<Esc>:wa<CR>a", { noremap = true, silent = true })

-- buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>c", ":bd<CR>", { noremap = true, silent = true })

-- windows
vim.keymap.set("n", "<leader>h", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>_", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>|", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", ":close<CR>", { noremap = true, silent = true })

-- yank
vim.keymap.set("n", "Y", "y$", { noremap = true })

-- pastemode
vim.keymap.set("n", "<F2>", function()
  vim.opt.paste = not vim.opt.paste:get()
  print("Paste mode: " .. (vim.opt.paste:get() and "ON" or "OFF"))
end, { noremap = true, silent = true, desc = "Toggle paste mode" })


vim.keymap.set("n", "<leader>F", function()
  local api = require("nvim-tree.api")
  if api.tree.is_visible() then
    api.tree.find_file({ open = true, focus = true })
  end
end, { desc = "Reveal file in tree if tree is visible", silent = true })


-- LSP bindings
-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename", buffer = 0 })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
