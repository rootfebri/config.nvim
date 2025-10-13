return (function()
  local lazy_plugins = {}
  local plugin_dir = vim.fn.stdpath 'config' .. '/lua/plugins'
  local scan = vim.loop.fs_scandir(plugin_dir)
  if not scan then
    return lazy_plugins
  end

  while true do
    local name, t = vim.loop.fs_scandir_next(scan)
    if not name then
      break
    end
    if t == 'file' and name:match '%.lua$' and not name:match 'init%.lua$' then
      local module = 'plugins.' .. name:gsub('%.lua$', '')
      local ok, mod = pcall(require, module)
      if ok and type(mod) == 'table' then
        for _, v in ipairs(mod) do
          table.insert(lazy_plugins, v)
        end
      elseif not ok then
        vim.notify(('Error loading %s: %s'):format(module, mod), vim.log.levels.ERROR)
      end
    end
  end

  return lazy_plugins
end)()
