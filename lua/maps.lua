local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- map kj,jk to ESC
keymap("i", "kj", "<ESC>", opts)
keymap("i", "jk", "<ESC>", opts)
keymap("v", "kj", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)

-- set line number
vim.api.nvim_create_autocmd("InsertEnter", { command = "set norelativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("InsertLeave", { command = "set relativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("TermOpen", { command = "startinsert", pattern = "*" })

-- format file on save
--[[ command = "lua vim.lsp.buf.formatting_sync(nil, 1000)", ]]
vim.api.nvim_create_autocmd("BufWritePre", {
	command = "lua vim.lsp.buf.format()",
	pattern = "*.cpp,*.css,*.go,*.h,*.html,*.js,*.json,*.jsx,*.lua,*.md,*.py,*.rs,*.ts,*.tsx,*.yaml,*.cs,*.svelte",
})

-- harpoon keymap
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>;", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)

-- nvim tree
keymap("n", "<C-e>", ":NvimTreeToggle<cr>", opts)
vim.keymap.set("n", "<C-j>", require("nvim-tree.api").marks.navigate.next)
vim.keymap.set("n", "<C-k>", require("nvim-tree.api").marks.navigate.prev)
vim.keymap.set("n", "<leader>ml", require("nvim-tree.api").marks.navigate.select)

-- vim-tmux navagation
vim.cmd("let g:tmux_navigator_no_mappings = 1")
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", opts)
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", opts)
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", opts)
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", opts)

-- Telescope
keymap(
	"n",
	"<leader>f",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false, hidden = true, no_ignore = true }))<cr>",
	opts
)
keymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>s", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<leader>c", "<cmd>Telescope commands<cr>", opts)
keymap("n", "<leader>ht", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>u", "<cmd>Telescope lsp_references<cr>", opts)
keymap("n", "<leader>e", "<cmd>Telescope diagnostics<cr>", opts)
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)

-- lazygit
keymap("n", "<C-g>", "<cmd>LazyGit<cr>", term_opts)

-- C-d, C-u
keymap("n", "<C-d>", "<C-d>zz", term_opts)
keymap("n", "<C-u>", "<C-u>zz", term_opts)

-- n
keymap("n", "n", "nzzzv", term_opts)
keymap("n", "N", "Nzzzv", term_opts)

-- Increment/decrement
keymap("n", "+", "<C-a>", term_opts)
keymap("n", "-", "<C-x>", term_opts)

-- Split window
keymap("n", "<leader>sp", ":split<Return><C-w>w", opts)
keymap("n", "<leader>vp", ":vsplit<Return><C-w>w", opts)

-- vim navigation
--[[ keymap("n", "<C-h>", "<C-w>h", opts) ]]
--[[ keymap("n", "<C-j>", "<C-w>j", opts) ]]
--[[ keymap("n", "<C-k>", "<C-w>k", opts) ]]
--[[ keymap("n", "<C-l>", "<C-w>l", opts) ]]

-- Resize window with shift+arrows
keymap("n", "<S-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- copy
keymap("v", "p", '"_dP', opts)

-- Move text up and down with shift+j, shift+k
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- goto error
keymap("n", "ge", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

-- formating
keymap("n", "<leader>sf", ":lua vim.lsp.buf.format {async = true}<cr>", opts)

-- tagbar
keymap("n", "<leader>tb", "<cmd>TagbarToggle<cr>", opts)
vim.cmd("let g:tagbar_show_linenumbers = 1")

-- j,k
keymap("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
keymap("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

keymap("n", "<Leader>/", ":nohlsearch<CR>", { silent = true })
keymap("n", "<Leader>vt", ":vsplit term://fish <CR>", { silent = true })
keymap("n", "<Leader>st", ":split term://fish <CR>", { silent = true })
keymap("t", "<Leader><Esc>", "<C-\\><C-n>", { silent = true })
keymap("n", "<Leader>v", ":edit ~/.config/nvim/init.lua<CR>", { silent = true })

-- go testing
keymap("n", "<space>gt", "<cmd>GoTestFunc<cr>", opts)

-- debuger
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>lua require('dap').continue()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>lua require('dap').step_over()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>i", "<cmd>lua require('dap').step_into()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>y", "<cmd>lua require('dap').step_out()<cr>", opts)

-- transparent
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		local highlights = {
			"Normal",
			"LineNr",
			"Folded",
			"NonText",
			"SpecialKey",
			"VertSplit",
			"SignColumn",
			"EndOfBuffer",
			"TablineFill", -- this is specific to how I like my tabline to look like
		}
		for _, name in pairs(highlights) do
			vim.cmd.highlight(name .. " guibg=none ctermbg=none")
		end
	end,
})

-- original buffers
--[[ keymap("n", "<C-l>", ":bnext<CR>", opts) ]]
--[[ keymap("n", "<C-h>", ":bprevious<CR>", opts) ]]
--[[ keymap("n", "<leader>9", "<cmd>blast<CR>", opts) ]]
-- tabline buffers
--[[ keymap("n", "<C-l>", ":TablineBufferNext<CR>", opts) ]]
--[[ keymap("n", "<C-h>", ":TablineBufferPrevious<CR>", opts) ]]
--[[ keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", opts) ]]
--[[ keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", term_opts) ]]
--[[ keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", opts) ]]
--[[ keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", opts) ]]
--[[ keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", opts) ]]
--[[ keymap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", opts) ]]
--[[ keymap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", opts) ]]
--[[ keymap("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", opts) ]]
--[[ keymap("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", opts) ]]
--[[ keymap("n", "<leader>$", "<cmd>BufferLineGoToBuffer -1<CR>", opts) ]]
-- BufferLine
--[[ keymap("n", "<leader>l", ":BufferLineCycleNext<CR>", opts) ]]
--[[ keymap("n", "<leader>h", ":BufferLineCyclePrev<CR>", opts) ]]
--[[ keymap("n", "<S-p>", ":BufferLineTogglePin<cr>", opts) ]]
