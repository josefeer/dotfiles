return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config =  function()
      require("nvim-tree").setup({})
    end,
    keys = {
      {
        '<leader>e',
        function()
          require("nvim-tree.api").tree.open({ find_file = true })
        end,
        desc = 'Find file in Tree'
      },
    }
  },
};
