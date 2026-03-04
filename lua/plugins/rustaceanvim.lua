local config = {
  checkOnSave = true,
  procMacro = {
    enable = true,
  },
  cargo = {
    allTargets = true,
    features = 'all',
    extraArgs = { '--no-deps' },
  },
  check = {
    allTargets = true,
    features = 'all',
    command = 'clippy',
  },
}

return {
  'rootfebri/rustaceanvim',
  version = '^6',
  lazy = false,
  ['rust-analyzer'] = config,
  rust_analyzer = config,
  config = {
    ['rust-analyzer'] = {
      cargo = {
        allTargets = true,
        features = 'all',
      },
      check = {
        command = 'clippy',
        extraArgs = { '--no-deps' },
      },
      checkOnSave = true,
    },
  },
}
