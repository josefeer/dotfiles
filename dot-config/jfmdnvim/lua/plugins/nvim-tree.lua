return {
  'nvim-tree/nvim-tree.lua',
  enabled = false,
  cmd = {'NvimTreeToggle', 'NvimTreeFindFileToggle'},
  keys = {
    { '\\', ':NvimTreeFindFileToggle<CR>', desc = 'NvimTree Toggle', silent = true },
  },
  opts = {
    view = {
      width = 45,
    },
  },
}
