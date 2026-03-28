return {
  {
    'rootfebri/rustaceanvim',
    version = '^6',
    lazy = false,
    init = function()
      vim.g.rustaceanvim = {
        server = {
          default_settings = {
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
              procMacro = {
                enable = true,
              },
            },
          },
        },
      }
    end,
  },
}
