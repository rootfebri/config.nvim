return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = 'fallback',
        async = true,
      },
      formatters_by_ft = {
        rust = { 'rustfmt', lsp_format = 'fallback' },
        php = { 'pint' },
        lua = { 'stylua' },
        javascript = { 'prettier', stop_after_first = true },
        javascriptreact = { 'prettier', stop_after_first = true },
        typescript = { 'prettier', stop_after_first = true },
        typescriptreact = { 'prettier', stop_after_first = true },
        json = { 'prettier' },
        graphql = { 'prettier', stop_after_first = true },
      },
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        ['pint'] = {
          command = 'pint',
          args = function(_, ctx)
            return { '--stdin-filename=' .. ctx.filename }
          end,
          stdin = true,
        },
      },
    },
  },
}
