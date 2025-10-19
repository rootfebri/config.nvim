return {
  'rootfebri/rustaceanvim',
  version = '^6',
  lazy = false,
  config = function()
    vim.cmd.RustAnalyzer {
      'config',
      {
        checkOnSave = {
          command = 'cargo',
          allTargets = true,
          arg = '--all',
        },
        procMacro = {
          enable = true,
        },
      },
    }
  end,
}
