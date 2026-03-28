return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = 'BufReadPost',
    init = function()
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    keys = {
      { '<C-S-+>', function() require('ufo').closeAllFolds() end, desc = 'Close all folds' },
      { '<C-S-_>', function() require('ufo').openAllFolds() end, desc = 'Open all folds' },
      { '<C-S-q>', 'za', desc = 'Toggle fold' },
      { '<C-S-e>', 'za', desc = 'Toggle fold' },
      {
        '<M-k>',
        function()
          local winid = require('ufo').peekFoldedLinesUnderCursor()
          if not winid then
            vim.lsp.buf.hover()
          end
        end,
        desc = 'Peek folded',
      },
    },
    opts = {
      provider_selector = function()
        return { 'lsp', 'indent' }
      end,
    },
  },
}
