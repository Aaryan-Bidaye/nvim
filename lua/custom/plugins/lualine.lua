return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'old',
          section_separators = { left = '', right = '' },
          --section_separators = '',
          component_separators = { left = '', right = '' },
          --component_separators = '',
          globalstatus = false,
        },
      }
    end,
  },
}
