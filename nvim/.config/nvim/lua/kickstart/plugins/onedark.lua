return {
  'navarasu/onedark.nvim',
  priority = 1000, -- load the colorscheme before other start plugins
  opts = {
    -- custom options here
  },
  config = function(_, opts)
    require('onedark').setup(opts) -- calling setup is optional
    vim.cmd [[colorscheme onedark]]
  end,
}
