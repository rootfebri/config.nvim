local bufnr = vim.api.nvim_get_current_buf()

-- or vim.lsp.buf.codeAction() if you don't want grouping.
-- supports rust-analyzer's grouping
vim.keymap.set('n', '<leader>a', function()
  vim.cmd.RustLsp 'codeAction'
end, { silent = true, buffer = bufnr })

-- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
vim.keymap.set('n', 'K', function()
  vim.cmd.RustLsp { 'hover', 'actions' }
  -- local ok, ts_utils = pcall(require, 'nvim-treesitter.ts_utils')
  -- if not ok then
  --   vim.cmd.RustLsp { 'hover', 'actions' }
  --   return
  -- end
  --
  -- local node = ts_utils.get_node_at_cursor()
  -- if not node then
  --   vim.cmd.RustLsp { 'hover', 'actions' }
  --   return
  -- end
  --
  -- local node_type = node:type()
  --
  -- if node_type == 'macro_invocation' then
  --   vim.cmd.RustLsp { 'expandMacro' }
  -- else
  --   vim.cmd.RustLsp { 'hover', 'actions' }
  -- end
end, { silent = true, buffer = true, desc = 'Rust Hover or Expand Macro' })
