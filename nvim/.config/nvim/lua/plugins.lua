require "paq" {
	"savq/paq-nvim"; -- Let Paq manage itself
	-- lsp autocomplete
	"neovim/nvim-lspconfig"; -- Mind the semi-colons
	"williamboman/mason.nvim";
	"williamboman/mason-lspconfig.nvim";
	"jose-elias-alvarez/null-ls.nvim";
	'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/cmp-nvim-lua';
	'hrsh7th/cmp-buffer';
	'hrsh7th/cmp-path';
	'hrsh7th/cmp-cmdline';
	"hrsh7th/nvim-cmp";
	"ray-x/lsp_signature.nvim";
	-- snipets
	"hrsh7th/cmp-vsnip";
	"hrsh7th/vim-vsnip";
	-- lualine
	"hoob3rt/lualine.nvim";
	"kyazdani42/nvim-web-devicons";
	"ryanoasis/vim-devicons";
	-- treesitter
	"nvim-treesitter/nvim-treesitter";
	-- telescope
	"nvim-lua/popup.nvim";
	"nvim-lua/plenary.nvim";
	"nvim-telescope/telescope.nvim";
	-- colorscheme
	"navarasu/onedark.nvim";
	-- hop
	"phaazon/hop.nvim";
	-- nvimtree
	"kyazdani42/nvim-tree.lua";
	-- which key
	"folke/which-key.nvim";
	-- terminal
	-- "akinsho/nvim-toggleterm.lua";
	-- auto-session
	"rmagatti/auto-session";
	"rmagatti/session-lens";
	-- comments
	"tpope/vim-commentary",
	-- copilot
	-- "zbirenbaum/copilot.lua"
}
require('onedark').load()

-- vim.cmd[[colorscheme tokyonight]]
