-- file: ~/.config/nvim/lua/custom/plugins/file_open.lua

-- Define the command
vim.api.nvim_create_user_command('OpenFiles', function(opts)
  local base = opts.args
  local header = base .. '.h'
  local source = base .. '.c'

  vim.cmd('tabnew include/' .. header)
  vim.cmd('vsplit src/' .. source)
end, {
  nargs = 1,
  desc = 'Open <name>.h and <name>.c in a tab with vertical split',
})

-- Define the key mapping
vim.keymap.set('n', '<leader>oc', function()
  vim.ui.input({ prompt = 'Base filename (without .h/.c): ' }, function(input)
    if input and input ~= '' then
      vim.cmd('tabnew include/' .. input .. '.h')
      vim.cmd('vsplit src/' .. input .. '.c')
    end
  end)
end, { desc = 'Open header and source files in tab with split' })

-- ✅ Return an empty table to satisfy lazy.nvim's plugin spec
return {}
