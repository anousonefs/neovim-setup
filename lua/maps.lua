local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Increment/decrement
keymap('n', '+', '<C-a>', term_opts)
keymap('n', '-', '<C-x>', term_opts)

-- Split window
keymap('n', ';s', ':split<Return><C-w>w', opts)
keymap('n', ';v', ':vsplit<Return><C-w>w', opts)

-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", ";h", "<C-w>h", opts)
keymap("n", ";j", "<C-w>j", opts)
keymap("n", ";k", "<C-w>k", opts)
keymap("n", ";l", "<C-w>l", opts)


-- Resize with arrows
keymap("n", "<S-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- original buffers
-- keymap("n", "<C-l>", ":bnext<CR>", opts)
-- keymap("n", "<C-h>", ":bprevious<CR>", opts)
keymap("n", "<C-w>", ":bdelete<cr>", opts)
keymap("i", "<C-w>", ":bdelete<cr>", opts)
keymap("n", "<leader>9", "<cmd>blast<CR>", opts)

-- BufferLine
keymap("n", "<C-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", opts)
keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", term_opts)
keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", "<cmd>blast<CR>", opts)
keymap("n", "<S-p>", ":BufferLineTogglePin<cr>", opts)

keymap("i", "kj", "<ESC>", opts)
keymap("i", "jk", "<ESC>", opts)
keymap("v", "kj", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- copy
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Telescope
-- keymap("n", ";f", "<cmd>Telescope find_files<cr>", opts)
keymap(
  "n",
  ";f",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts
)
keymap("n", ";t", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", ";c", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<leader>c", "<cmd>Telescope commands<cr>", opts)

-- nvim tree
keymap("n", "<C-t>", ":NvimTreeToggle<cr>", opts)

-- formating
keymap("n", "<leader>f", ":lua vim.lsp.buf.formatting()<cr>", opts)

-- tagbar
keymap("n", "<leader>t", "<cmd>TagbarToggle<cr>", opts)

-- remove blank line
-- keymap("n", "<leader>bd", "<cmd>g/^\s*$/d<cr>")

-- j,k
keymap("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
keymap("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
keymap("n", "<Leader>/", ":nohlsearch<CR>", { silent = true })
keymap("n", "<Leader>s", ":vsplit term://fish <CR>", { silent = true })
keymap("t", "<Leader><Esc>", "<C-\\><C-n>", { silent = true })
keymap("n", "<Leader>v", ":edit ~/.config/nvim/init.lua<CR>", { silent = true })

-- format file on save
vim.api.nvim_create_autocmd("BufWritePre", {
  command = "lua vim.lsp.buf.formatting_sync(nil, 1000)",
  pattern = "*.cpp,*.css,*.go,*.h,*.html,*.js,*.json,*.jsx,*.lua,*.md,*.py,*.rs,*.ts,*.tsx,*.yaml",
})

-- set line number
vim.api.nvim_create_autocmd("InsertEnter", { command = "set norelativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("InsertLeave", { command = "set relativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("TermOpen", { command = "startinsert", pattern = "*" })

-- harpoon keymap
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>y", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>u", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>i", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)

-- lf
vim.keymap.set("n", "<C-e>", ":Lf<CR>")
vim.cmd "let g:lf_replace_netrw = 1"
vim.cmd "let g:lf_width = 0.9"
vim.cmd "let g:lf_height = 0.9"
