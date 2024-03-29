local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	print("import bufferline failed")
	return
end

bufferline.setup({
	options = {
		view = "none",
		--[[ numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string, ]]
		--[[ numbers = function(opts) ]]
		--[[   return string.format('%s', opts.ordinal) ]]
		--[[ end, ]]
		--[[ number = "ordinal", ]]
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		-- NOTE: this plugin is designed with this icon in mind,
		-- and so changing this is NOT recommended, this is intended
		-- as an escape hatch for people who cannot bear it for whatever reason
		--[[ indicator_icon = "▎", ]]
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		--[[ close_icon = '', ]]
		left_trunc_marker = "",
		right_trunc_marker = "",
		name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
			if buf.name:match("%.lua") then
				return vim.fn.fnamemodify(buf.name, ":t:r")
			end
			if buf.name:match("%.go") then
				return vim.fn.fnamemodify(buf.name, ":t:r")
			end
		end,
		-- name_formatter = function()
		--   return ""
		-- end,
		max_name_length = 10,
		max_prefix_length = 10, -- prefix used when a buffer is de-duplicated
		tab_size = 20,
		--[[ diagnostics = true, -- | "nvim_lsp" | "coc", ]]
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = true,
		--[[ diagnostics_indicator = function(count, level, diagnostics_dict, context) ]]
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		-- NOTE: this will be called a lot so don't do any heavy processing here
		custom_filter = function(buf_number, buf_numbers)
			-- filter out filetypes you don't want to see
			if vim.bo[buf_number].filetype ~= ".md" then
				return true
			end
			-- filter out by buffer name
			if vim.fn.bufname(buf_number) ~= "lua" then
				return true
			end
			-- filter out based on arbitrary rules
			-- e.g. filter out vim wiki buffer from tabline in your work repo
			if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
				return true
			end
			-- filter out by it's index number in list (don't show first buffer)
			if buf_numbers[1] ~= buf_number then
				return true
			end
		end,
		--[[ offsets = { { filetype = "NvimTree", text = "", padding = 1 } }, ]]
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center", -- | "center" | "right"
				separator = true,
				padding = 0,
			},
		},
		color_icons = true, -- whether or not to add the filetype icon highlights
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "thick", -- | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = true,
		always_show_bufferline = false,
		--[[ sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b) ]]
		--[[ sort_by = function(buffer_a, _) ]]
		--[[   -- add custom logic ]]
		--[[   return buffer_a.modified ]]
		--[[ end ]]
		--[[ groups = { ]]
		--[[   options = { ]]
		--[[     toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible ]]
		--[[   }, ]]
		--[[   items = { ]]
		--[[     { ]]
		--[[       name = "Tests", -- Mandatory ]]
		--[[       highlight = { underline = true, sp = "blue" }, -- Optional ]]
		--[[       priority = 2, -- determines where it will appear relative to other groups (Optional) ]]
		--[[       icon = "", -- Optional ]]
		--[[       matcher = function(buf) -- Mandatory ]]
		--[[         return buf.filename:match('%_test') or buf.filename:match('%_spec') ]]
		--[[       end, ]]
		--[[     }, ]]
		--[[     { ]]
		--[[       name = "Docs", ]]
		--[[       highlight = { undercurl = true, sp = "green" }, ]]
		--[[       auto_close = false, -- whether or not close this group if it doesn't contain the current buffer ]]
		--[[       matcher = function(buf) ]]
		--[[         return buf.filename:match('%.md') or buf.filename:match('%.txt') ]]
		--[[       end, ]]
		--[[       separator = { -- Optional ]]
		--[[         style = require('bufferline.groups').separator.tab ]]
		--[[       }, ]]
		--[[     } ]]
		--[[   } ]]
		--[[ }, ]]
	},
	highlights = {
		fill = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		background = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},

		-- buffer_selected = {
		--   fg = {attribute='fg',highlight='#ff0000'},
		--   bg = {attribute='bg',highlight='#0000ff'},
		--   gui = 'none'
		--   },
		buffer_visible = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},

		close_button = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		close_button_visible = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		-- close_button_selected = {
		--   fg = {attribute='fg',highlight='TabLineSel'},
		--   bg ={attribute='bg',highlight='TabLineSel'}
		--   },

		tab_selected = {
			fg = { attribute = "fg", highlight = "Normal" },
			bg = { attribute = "bg", highlight = "Normal" },
		},
		tab = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		tab_close = {
			-- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
			fg = { attribute = "fg", highlight = "TabLineSel" },
			bg = { attribute = "bg", highlight = "Normal" },
		},

		duplicate_selected = {
			fg = { attribute = "fg", highlight = "TabLineSel" },
			bg = { attribute = "bg", highlight = "TabLineSel" },
			italic = true,
		},
		duplicate_visible = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
			italic = true,
		},
		duplicate = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
			italic = true,
		},

		modified = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		modified_selected = {
			fg = { attribute = "fg", highlight = "Normal" },
			bg = { attribute = "bg", highlight = "Normal" },
		},
		modified_visible = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},

		separator = {
			fg = { attribute = "bg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		separator_selected = {
			fg = { attribute = "bg", highlight = "Normal" },
			bg = { attribute = "bg", highlight = "Normal" },
		},
		-- separator_visible = {
		--   fg = {attribute='bg',highlight='TabLine'},
		--   bg = {attribute='bg',highlight='TabLine'}
		--   },
		indicator_selected = {
			fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
			bg = { attribute = "bg", highlight = "Normal" },
		},
	},
})
