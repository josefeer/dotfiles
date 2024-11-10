return {
  'nvim-tree/nvim-tree.lua',
  keys = {
    { '\\', ':NvimTreeToggle<CR>', desc = 'NvimTree Toggle', silent = true },
  },
  opts = {
    view = {
      width = 45,
    },
  },
}
