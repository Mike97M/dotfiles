return {
  'navarasu/onedark.nvim',
  opts = {
    -- custom options here
  },
  config = function(_, opts)
    require('onedark').setup(opts) -- calling setup is optional
    vim.cmd [[colorscheme onedark]]
  end,
}
