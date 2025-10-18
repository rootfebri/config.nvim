return {
  'rootfebri/rustaceanvim',
  version = '^6',
  lazy = false,
  config = function()
    vim.cmd.RustAnalyzer {
      'config',
      {
        checkOnSave = {
          command = 'clippy',
          allTargets = true,
        },
        procMacro = {
          enable = true,
        },
      },
    }
  end,
}
