return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true
      require('bufferline').setup {
        highlights = {},
        options = {
          indicator = {
            style = 'underline',
          },
          diagnostics = 'nvim_lsp',
        },
      }
    end,
  },
}
