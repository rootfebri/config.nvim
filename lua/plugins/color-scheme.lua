return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        -- Style
        commentStyle = { italic = true },
        keywordStyle = { italic = true },
        colors = {
          theme = {
            ---@type ThemeColors
            wave = {
              diag = {
                error = '#FF5370',
                hint = '#8BE9FD',
                info = '#8BE9FD',
                warning = '#FDC48B',
              },
              ui = {
                bg = '#0f111a',
                float = {
                  bg_border = '#26DEFA',
                },
              },
              syn = {
                variable = '#C3CEE3',
                constant = '#D0CA8D',
                comment = '#717CB4',
                keyword = '#C792EA',
                identifier = '#C3CEE3',
                parameter = '#26DEFF',
                string = '#AAAAAA',
                type = '#22C4A5',
                fun = '#6DC7FF',
                punct = '#89DDFF',
                preproc = '#4EADE5',
                number = '#F78C6C',
                operator = '#C792EA',
                deprecated = '#717CB4',
                special1 = '#82FFD3',
                special2 = '#FF5370',
                special3 = '#FFFFFF',
                statement = '#53FF61',
                regex = '#53FF61',
              },
            },
          },
        },
      }
      vim.cmd.colorscheme 'kanagawa-wave'
    end,
  },
}
