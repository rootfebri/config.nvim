vim.g.rust_recommended_style = 0
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.spell = false
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 4
vim.o.confirm = false

-- Pasting
vim.keymap.set({ 'n', 'v' }, 'y', '"+y')
vim.keymap.set({ 'n', 'v' }, 'd', '"+d')
vim.keymap.set('n', 'Y', '"+Y')
vim.keymap.set('n', 'D', '"+D')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<M-S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Cycle Next buffer' })
vim.keymap.set('n', '<M-S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Cycle Next buffer' })

vim.keymap.set('n', '<C-d>', 'mzyyp`zj', { desc = 'Duplicate line and stay on new line' })
vim.keymap.set('n', '<M-d>', 'mzyyp`z', { desc = 'Duplicate line and stay on old line' })

-- Move current line up/down
vim.keymap.set('n', '<leader>j', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<leader>k', ':m .-2<CR>==', { desc = 'Move line up' })

vim.keymap.set('n', '<M-w>', '<CMD>BufferLineCyclePrev<CR><CMD>BufferLineCloseRight<CR>', { desc = 'Close buffers' })
vim.keymap.set('n', '<C-M-w>', '<CMD>BufferLineCloseOthers<CR>', { desc = 'Close other buffers' })

-- stylua: ignore start
vim.g.VM_default_mappings = 0
vim.g.VM_maps = {
  ['Add Cursor Down']    = '<C-j>',
  ['Add Cursor Up']      = '<C-k>',
  ['Find Under']         = '<C-n>',
  ['Find Subword Under'] = '<C-n>',
  ['Select Cursor Down'] = '<M-C-F21>',
  ['Select Cursor Up']   = '<M-C-F22>',
  ['Skip Region']        = 'q',
  ['Remove Region']      = 'Q',
  ['Surround']           = 'S',
  ['Align']              = '<leader>a',
}
-- stylua: ignore end

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  'NMAC427/guess-indent.nvim',
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns',
  require 'plugins',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
