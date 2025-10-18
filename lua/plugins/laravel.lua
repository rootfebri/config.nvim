return {
  {
    'adibhanna/laravel.nvim',
    ft = { 'php', 'blade' },
    dependencies = {
      'folke/snacks.nvim',

      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>la', '<CMD>Artisan<CR>', desc = 'Laravel Artisan' },
      { '<leader>lr', '<CMD>LaravelRoute<CR>', desc = 'List Routes' },
      { '<leader>lC', '<CMD>LaravelController<CR>', desc = 'Show All Controllers' },
      { '<leader>lm', '<CMD>LaravelMake<CR>', desc = 'Laravel Make' },
    },
    config = function()
      require('laravel').setup {
        notification = false,
        debug = false,
      }
    end,
  },
}
