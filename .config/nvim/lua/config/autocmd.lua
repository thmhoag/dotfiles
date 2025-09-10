
-- This auto command will fix NvimTree when opening a session that
-- had NvimTree open as well (othwerwise it would show up blank)
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = 'NvimTree*',
  callback = function()

    local api = require('nvim-tree.api')
    local tree = require('nvim-tree.api').tree

    if tree.is_visible() then return end
	
    api.tree.open()

  end,
})

-- NvimTree customizations
-- Make :bd and :q behave as usual when tree is visible
vim.api.nvim_create_autocmd({ 'BufEnter', 'QuitPre' }, {
  nested = true,
  callback = function(e)
    local tree = require('nvim-tree.api').tree

    if not tree.is_visible() then return end

    local winCount = 0
    for _, winId in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(winId).focusable then
        winCount = winCount + 1
      end
    end

    -- Delay :qall to allow other QuitPre handlers (like persisted.nvim) to run
    if e.event == 'QuitPre' and winCount == 2 then
      vim.schedule(function()
        vim.cmd("qall")
      end)
    end

    if e.event == 'BufEnter' and winCount == 1 then
      vim.defer_fn(function()
        tree.toggle({ find_file = true, focus = true })
        tree.toggle({ find_file = true, focus = false })
      end, 10)
    end
  end
})

-- Enable hints on LspAttach and toggle keymap
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf ---@type number
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
      vim.keymap.set('n', '<leader>i', function()
        vim.lsp.inlay_hint.enable(
          not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
          { bufnr = bufnr }
        )
      end, { buffer = bufnr })
    end
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "PersistedSavePre",
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.bo[buf].filetype == "aerial" then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end,
})
