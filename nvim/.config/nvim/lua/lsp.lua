local nvim_lsp = require('lspconfig')
-- local lspconfig = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	local rc = client.server_capabilities

	if client.name == 'pyright' then
		rc.hover = false
		vim.keymap.set("n", "<Leader>ii", "<cmd>PyrightOrganizeImports<CR>", {
			buffer = bufnr,
			silent = true,
			noremap = true,
		})
	end

	if client.name == 'pylsp' then
		rc.rename = false
		rc.signature_help = false
	end
	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	--LSP signature
	require('lsp_signature').on_attach()
	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	-- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	-- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap("n",
		"gH",
		"<CMD>lua vim.diagnostic.open_float(0, { scope = 'line', source = 'always', border = 'rounded' })<CR>",
		opts
	)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap('n', '<space>F', '<cmd>lua vim.lsp.buf.format {async=True}<CR>', opts)
	-- Set some keybinds conditional on server capabilities
	-- if client.resolved_capabilities.document_formatting then
	-- 	buf_set_keymap("n", "<space>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	-- elseif client.resolved_capabilities.document_range_formatting then
	-- 	buf_set_keymap("n", "<space>ff", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	-- end
	-- format on save
	local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.formatting()
		end,
	})
end

-- nvim_lsp.pylsp.setup({on_attach = on_attach})

-- Setup nvim-cmp.
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"

local cmp = require 'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
		end,
	},
	mapping = {
		['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's', 'c' }),
		['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's', 'c' }),
		['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
-- local lsp_installer = require "mason"

-- require("mason").setup()
require("mason").setup {
	ui = {
		icons = {
			package_installed = "✓"
		}
	}
}
-- Include the servers you want to have installed by default below
local servers = {
	"bashls",
	"pyright",
	"pylsp",
	"ruff_lsp",
	"volar",
	"yamlls",
	"gopls",
	"lua_ls",
	"html",
}

require("mason-lspconfig").setup {
	ensure_installed = servers,
}
-- for _, name in pairs(servers) do
-- 	local server_is_found, server = lsp_installer.get_server(name)
-- 	if server_is_found and not server:is_installed() then
-- 		print("Installing " .. name)
-- 		server:install()
-- 	end
-- end
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Settings inspired from: https://www.reddit.com/r/neovim/comments/sazbw6/comment/hw1s6qg/?utm_source=reddit&utm_medium=web2x&context=3
local settings = {
	pyright = {
		python = {
			analysis = {
				useLibraryCodeForTypes = true,
				diagnosticSeverityOverrides = {
					reportGeneralTypeIssues = "none",
					reportOptionalMemberAccess = "none",
					reportOptionalSubscript = "none",
					reportPrivateImportUsage = "none",
				},
				autoImportCompletions = true,
			},
			linting = { pylintEnabled = false }
		}
	},
	pylsp = {
		pylsp = {
			builtin = {
				installExtraArgs = { 'flake8', 'pycodestyle', 'pydocstyle', 'pyflakes', 'pylint', 'yapf', 'ruff' },
			},
			plugins = {
				jedi_completion = { enabled = false },
				rope_completion = { enabled = false },
				flake8 = { enabled = false },
				pyflakes = { enabled = false },
				pylint = { enabled = true },
				ruff = { enabled = true },
				pycodestyle = {
					ignore = { 'E226', 'E266', 'E302', 'E303', 'E304', 'E305', 'E402', 'C0103', 'W0104', 'W0621', 'W391', 'W503', 'W504' },
					maxLineLength = 99,
				},
			},
		},
	},
	-- ruff_lsp = {

	-- },
	-- ["gopls"] = function(opts)
	-- 	opts.settings = {
	-- 		gopls = {
	-- 			analyses = {
	-- 				unusedparams = true,
	-- 			},
	-- 			staticcheck = true,
	-- 		},
	-- 		format = {
	-- 			enable = true,
	-- 		},
	-- 	}
	-- end,
}


require('mason-lspconfig').setup_handlers({ function(server)
	-- Specify the default options which we'll use to setup all servers
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
		format = { enable = true },
	}


	if settings[server.name] then
		opts['settings'] = settings[server.name]
	end
	-- server:setup(opts)
	nvim_lsp[server].setup(opts)
	-- lspconfig[server].setup({})
end,
})


require 'lspconfig'.ruff_lsp.setup {
	init_options = {
		settings = {
			-- Any extra CLI arguments for `ruff` go here.
			args = {},
		}
	}
}
-- require'lspconfig'.pyright.setup{ on_attach = on_attach}
-- nvim_lsp = require "lspconfig"
-- nvim_lsp.pyright.setup {
-- 	capabilities = capabilities;
-- 	on_attach = on_attach
-- }


-- nvim_lsp.gopls.setup {
-- 	capabilities = capabilities;
-- 	on_attach = on_attach;
-- 	cmd = {"gopls", "serve"},
-- 	settings = {
-- 		gopls = {
-- 			analyses = {
-- 				unusedparams = true,
-- 			},
-- 			staticcheck = true,
-- 		},
-- 	},
-- }
