return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    ---@type tokyonight.Config
    local opts = {
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
    }

    require('tokyonight').setup(opts)
  end,
}
