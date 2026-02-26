return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    opts = function()
      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      local expandAllFolds = require('ufo').openAllFolds
      local collapseAllFolds = require('ufo').closeAllFolds

      vim.keymap.set('n', '<M-S-e>', expandAllFolds)
      vim.keymap.set('n', '<M-S-q>', collapseAllFolds)

      vim.keymap.set('n', '<M-q>', 'za')
      vim.keymap.set('n', '<M-e>', 'za')

      vim.keymap.set('n', '<M-k>', function()
        local winid = require('ufo').peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end, { desc = 'Peek folded' })
      -- Tell the server the capability of foldingRange,
      -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = vim.lsp.get_clients()

      for _, ls in ipairs(language_servers) do
        require('lspconfig')[ls].setup {
          capabilities = capabilities,
        }
      end

      require('ufo').setup {
        provider_selector = function()
          return { 'lsp', 'indent' }
        end,
      }
    end,
  },
}
