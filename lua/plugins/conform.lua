return {
  {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { lsp_format = 'fallback', timeout_ms = 500 }
      end,
      mode = { 'n', 'v' },
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    log_level = vim.log.levels.DEBUG,
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
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
      ['shfmt'] = {
        inherit = false,
        command = 'shfmt',
        args = { '-filename', '$FILENAME', '-i', '2' },
      },
    },
  },
  },
}
