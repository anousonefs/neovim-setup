local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	print("import nvim-tree failed")
	return
end

--[[ local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config") ]]
--[[ if not config_status_ok then ]]
--[[ 	print("import nvim-tree.config failed") ]]
--[[ 	return ]]
--[[ end ]]
--[[ local tree_cb = nvim_tree_config.nvim_tree_callback ]]

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvim_tree.setup({
	auto_reload_on_write = true,
	--[[ create_in_closed_folder = true, ]]
	--[[ ignore_buffer_on_setup = true, ]]
	disable_netrw = false,
	hijack_netrw = true,
	hijack_cursor = true,
	--[[ open_on_setup = false, ]]
	--[[ open_on_setup_file = false, ]]
	hijack_unnamed_buffer_when_opening = true,
	open_on_tab = true,
	root_dirs = {},
	--[[ ignore_buf_on_tab_change = {}, ]]
	--[[ sort_by = "modification_time", ]]
	sort_by = "name",
	prefer_startup_root = true,
	sync_root_with_cwd = true,
	reload_on_bufenter = true,
	respect_buf_cwd = true,
	on_attach = "disable", -- function(bufnr). If nil, will use the deprecated mapping strategy
	--[[ remove_keymaps = false, -- boolean (disable totally or not) or list of key (lhs) ]]
	--[[ ignore_ft_on_setup = { ]]
	--[[ 	"startify", ]]
	--[[ 	"dashboard", ]]
	--[[ 	"alpha", ]]
	--[[ }, ]]
	update_cwd = false,
	-- update_to_buf_dir = {
	--   enable = true,
	--   auto_open = true,
	-- },
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
		update_root = false,
	},
	view = {
		adaptive_size = false,
		centralize_selection = true,
		width = 27,
		--[[ height = 30, ]]
		--[[ hide_root_folder = false, ]]
		side = "left",
		preserve_window_proportions = true,
		signcolumn = "yes",
		--[[ mappings = { ]]
		--[[ 	custom_only = false, ]]
		--[[ list = { ]]
		--[[ 	{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") }, ]]
		--[[ 	{ key = "h", cb = tree_cb("close_node") }, ]]
		--[[ 	{ key = "v", cb = tree_cb("vsplit") }, ]]
		--[[ }, ]]
		--[[ }, ]]
		number = true,
		relativenumber = true,
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = true,
		full_name = true,
		highlight_opened_files = "none",
		root_folder_modifier = ":t",
		indent_markers = {
			enable = false,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "",
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
					--[[ arrow_closed = "", ]]
					--[[ arrow_open = "", ]]
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		special_files = {
			"Cargo.toml",
			"Makefile",
			"README.md",
			"readme.md",
			"docker-compose.yml",
			"Dockerfile",
			"main.go",
		},
		symlink_destination = true,
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	system_open = {
		cmd = "",
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
		exclude = {},
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
	},
	git = {
		enable = true,
		ignore = false,
		show_on_dirs = true,
		timeout = 400,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = true,
			restrict_above_cwd = true,
		},
		expand_all = {
			max_folder_discovery = 300,
			exclude = { ".git", "node_modules" },
		},
		open_file = {
			quit_on_open = false,
			resize_window = true,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
		remove_file = {
			close_window = true,
		},
	},
	trash = {
		cmd = "gio trash",
		require_confirm = true,
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	log = {
		enable = true,
		truncate = false,
		types = {
			all = true,
			config = false,
			copy_paste = false,
			dev = true,
			diagnostics = true,
			git = true,
			profile = true,
			watcher = true,
		},
	},
})
