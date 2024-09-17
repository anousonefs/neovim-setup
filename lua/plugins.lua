local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("packer not found!")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- plugins that neovim commond used
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- autopairs
	use("windwp/nvim-autopairs")

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- Lazy loading:
	use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })

	-- markdown preview
	--[[ use({ ]]
	--[[ 	"iamcco/markdown-preview.nvim", ]]
	--[[ 	run = "cd app && npm install", ]]
	--[[ 	setup = function() ]]
	--[[ 		vim.g.mkdp_filetypes = { "markdown" } ]]
	--[[ 	end, ]]
	--[[ 	ft = { "markdown" }, ]]
	--[[ }) ]]

	-- theme
	use("folke/tokyonight.nvim")
	use("NLKNguyen/papercolor-theme")
	use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme

	-- cmp
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lua") -- snippets

	-- snippet
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- LSP

	-- telescope
	-- use "nvim-telescope/telescope.nvim"
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("fannheyward/telescope-coc.nvim")

	-- Treesitter for hight light text
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")

	-- vim surround
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	-- comment
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- git
	use("lewis6991/gitsigns.nvim")

	-- file explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})

	-- tagbar
	use("preservim/tagbar")

	use("ThePrimeagen/harpoon") -- harpoon for navigation

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("nvim-lualine/lualine.nvim") -- Statusline

	-- buffer
	use("akinsho/bufferline.nvim")

	-- lf
	--[[ use 'ptzz/lf.vim' ]]
	--
	--[[ use("voldikss/vim-floaterm") ]]

	-- terminal
	use("akinsho/toggleterm.nvim")

	-- lazygit
	use("kdheepak/lazygit.nvim")

	-- dashboard
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	-- managing & installing lsp servers, linters & formatters
	use({ "williamboman/mason.nvim", opts = {
		ensure_installed = {
			"rust-analyzer",
		},
	} }) -- in charge of managing lsp servers, linters & formatters
	use({ "saecki/crates.nvim", ft = { "rust", "toml" } })

	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion

	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis

	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	use({
		"kdheepak/tabline.nvim",
		requires = { { "hoob3rt/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons", opt = true } },
	})

	--[[ use({ ]]
	--[[ 	"Exafunction/codeium.vim", ]]
	--[[ 	config = function() ]]
	--[[ 		-- Change '<C-g>' here to any keycode you like. ]]
	--[[ 		vim.keymap.set("i", "<leader>g", function() ]]
	--[[ 			return vim.fn["codeium#Accept"]() ]]
	--[[ 		end, { expr = true }) ]]
	--[[ 		vim.keymap.set("i", "<leader>]", function() ]]
	--[[ 			return vim.fn["codeium#CycleCompletions"](1) ]]
	--[[ 		end, { expr = true }) ]]
	--[[ 		vim.keymap.set("i", "<leader>[", function() ]]
	--[[ 			return vim.fn["codeium#CycleCompletions"](-1) ]]
	--[[ 		end, { expr = true }) ]]
	--[[ 		vim.keymap.set("i", "<leader>x", function() ]]
	--[[ 			return vim.fn["codeium#Clear"]() ]]
	--[[ 		end, { expr = true }) ]]
	--[[ 	end, ]]
	--[[ }) ]]

	--[[ use({ "codota/tabnine-nvim", run = "./dl_binaries.sh" }) ]]

	--[[ use("madox2/vim-ai") ]]

	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "",
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})

	use("fatih/vim-go")

	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- debuger
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("leoluz/nvim-dap-go")

	use("windwp/nvim-ts-autotag")

	use("ThePrimeagen/vim-be-good")

	use("leafOfTree/vim-svelte-plugin")

	use({
		"cuducos/yaml.nvim",
		ft = { "yaml" }, -- optional
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
		},
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

-- haha
