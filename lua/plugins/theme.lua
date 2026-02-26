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
      on_colors = function(_) end,
      on_highlights = function(_, _) end,
    }

    require('tokyonight').setup(opts)
  end,
}
