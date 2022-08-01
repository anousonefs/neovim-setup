local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<S-h>", "<C-w>h", opts)
keymap("n", "<S-j>", "<C-w>j", opts)
keymap("n", "<S-k>", "<C-w>k", opts)
keymap("n", "<S-l>", "<C-w>l", opts)

--keymap("n", "<C-e>", ":Lex 20<cr>", opts)

-- Resize with arrows
--keymap("n", "<C-Up>", ":resize +2<CR>", opts)
--keymap("n", "<C-Down>", ":resize -2<CR>", opts)
--keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
--keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press kj or jk fast to ESC
keymap("i", "kj", "<ESC>", opts)
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Pres kj or jk fast to ESC
keymap("v", "kj", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)

-- Move text up and down
--keymap("v", "<A-j>", ":m .+1<CR>==", opts)
--keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
--keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
--keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
--keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
--keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
--keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
--keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
-- keymap("n", ";f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", ";f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", ";t", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", ";c", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<leader>c", "<cmd>Telescope commands<cr>", opts)
keymap("n", "<leader>f", "<cmd>Telescope find_files cwd=~/.config<cr>", opts)
-- keymap("n", ";b", "<cmd>Telescope git_branches<cr>", opts) -- show git branchs
-- keymap("n", ";u", "<cmd>Telescope lsp_references<cr>", opts) -- show file that use this
-- keymap("n", ";e", "<cmd>Telescope diagnostics<cr>", opts) -- go to error definition. my favorite

-- nerd tree
-- autocmd VimEnter * NERDTree
-- vim.api.nvim_create_autocmd("BufEnter", {command="NERDTree", buffer = 1})
-- keymap("n", "<C-e>", ":NERDTreeToggleVCS<cr>", opts)
keymap("n", "<C-e>", ":NvimTreeToggle<cr>", opts)
keymap("n", "<C-t>", ":NERDTreeToggle<cr>", opts)
keymap("n", "<C-f>", ":NERDTreeFocus<cr>", opts)
-- Exit Vim if NERDTree is the only window remaining in the only tab.
-- autocmd VimEnter * NERDTree

-- buffers
keymap("n", "<C-w>", ":Bdelete<cr>", opts)
keymap("i", "<C-w>", ":Bdelete<cr>", opts)
keymap("n", "<S-p>", ":BufferLineTogglePin<cr>", opts)

-- formating
keymap("n", "<leader>f", ":lua vim.lsp.buf.formatting()<cr>", opts)

-- tagbar
keymap("n", "<leader>t", "<cmd>TagbarToggle<cr>", opts)

-- remove blank line
-- keymap("n", "<leader>bd", "<cmd>g/^\s*$/d<cr>")

-- j,k
keymap("n", "k", "v:count == 0 ? \"gk\" : \"k\"", {expr=true,silent=true})
keymap("n", "j", "v:count == 0 ? \"gj\" : \"j\"", {expr=true,silent=true})
keymap("n", "<Leader>/", ":nohlsearch<CR>", { silent = true })
keymap("n", "<Leader>l", ":vsplit term://fish <CR>", { silent = true })
keymap("t", "<Leader><Esc>", "<C-\\><C-n>", { silent = true })
keymap("n", "<Leader>v", ":edit ~/.config/nvim/init.lua<CR>", { silent = true })
