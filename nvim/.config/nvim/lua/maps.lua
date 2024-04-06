local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "s", "<cmd>lua require'hop'.hint_words()<cr>")
map("n", "<leader>.", "<cmd>HopChar2<cr>")
-- map("n", "<leader>h", "<cmd>lua require'hop'.hint_words()<cr>")
map("n", "<leader>p", "<cmd>SearchSession<cr>")
-- map("n", "<leader>l", "<cmd>lua require'hop'.hint_lines()<cr>")
map("v", "<leader>h", "<cmd>lua require'hop'.hint_words()<cr>")
-- map("v", "<leader>l", "<cmd>lua require'hop'.hint_lines()<cr>")


-- telescope maps

map("n", "<leader><space>", "<cmd>lua require('telescope.builtin').find_files()<cr>")
map('n', '<leader>,', '<cmd>Telescope buffers show_all_buffers=true<CR>')
map('n', '<leader>/', '<cmd>Telescope live_grep<CR>', opts)
map('n', '<leader>:', '<cmd>Telescope command_history<CR>', opts)

map('n', '<leader>sg', '<cmd>Telescope live_grep<CR>', opts)
map('n', '<leader>sb', '<cmd>Telescope current_buffer_fuzzy_find<CR>', opts)
map('n', '<leader>ss', '<cmd>Telescope lsp_document_symbols<CR>', opts)
map('n', '<leader>sh', '<cmd>Telescope command_history<CR>', opts)
map('n', '<leader>sm', '<cmd>Telescope marks<CR>', opts)

-- open things
map('n', '<leader>oe', '<cmd>NvimTreeToggle<CR>')
-- create file
-- map('n', '<Leader>fn', ':new<CR>')


local opts = { silent = true }

-- ESC to turn off search highlighting
map('n', '<esc>', ':noh<CR>', opts)
-- Exit insert mode faster with jk
map('i', 'jk', '<ESC>', opts)

---[[-----------------]]---
--    Resizing Splits    --
---]]-----------------[[---
vim.cmd([[
  nnoremap <silent> <C-Up>    :resize +2<CR>
  nnoremap <silent> <C-Down>  :resize -2<CR>
  nnoremap <silent> <C-Right> :vertical resize -2<CR>
  nnoremap <silent> <C-Left>  :vertical resize +2<CR>
]])

-- windows
map('n', '<leader>ww', '<C-W>p', opts)
map('n', '<leader>wd', '<C-W>c', opts)
map('n', '<leader>wc', '<C-W>c', opts)
map('n', '<leader>w-', '<C-W>s', opts)
map('n', '<leader>w|', '<C-W>v', opts)
map('n', '<leader>w2', '<C-W>v', opts)
map('n', '<leader>wh', '<C-W>h', opts)
map('n', '<leader>wj', '<C-W>j', opts)
map('n', '<leader>wl', '<C-W>l', opts)
map('n', '<leader>wk', '<C-W>k', opts)
map('n', '<leader>wH', '<C-W>5<', opts)
map('n', '<leader>wJ', '<cmd>resize +5<CR>', opts)
map('n', '<leader>wL', '<C-W>5>', opts)
map('n', '<leader>wK', '<cmd>resize -5<CR>', opts)
map('n', '<leader>w=', '<C-W>=', opts)
map('n', '<leader>ws', '<C-W>s', opts)
map('n', '<leader>wv', '<C-W>v', opts)

-- windows navigation

map('n', '<leader>wh', '<C-w>h')
map('n', '<leader>wj', '<C-w>j')
map('n', '<leader>wk', '<C-w>k')
map('n', '<leader>wl', '<C-w>l')
--
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-w>', '<C-w>w')


map('n', '<leader>ot', '<cmd>ToggleTerm<CR>', opts)
