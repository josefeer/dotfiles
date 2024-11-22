return {
  'nvim-tree/nvim-tree.lua',
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
