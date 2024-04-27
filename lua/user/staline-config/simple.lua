local ok, staline = pcall(require, 'staline')
if not ok then
  vim.notify("import staline failed")
  return
end
local percentage = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = {
    "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██"
  }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end
local time = function()
  return os.date("%a │ %H:%M %x")
end
local my_colors = { n = "#9CCFD8", i = "#3E8FB0", c = "#286983", v = "#56959F" }
staline.setup {
  sections = {
    left = {
      'mode', ' ', { 'StalineBranch', 'branch' }
      -- branch,
    },
    mid = { { 'StalineName', 'file_name' } },
    right = { '-lsp', ' ', time, '  ', percentage }
  },
  --  sections = {
  -- 	left = {
  -- 		'▊', ' ', { 'Evil', ' ' }, ' ',         -- The mode and evil sign
  -- 		'file_size', ' ',                        -- Filesize
  -- 		{ 'StalineFile', 'file_name' }, ' '       -- Filename in different highlight
  -- 	},
  -- 	mid = { ' ', 'lsp_name' },                      -- "lsp_name" is still a little buggy
  -- 	right = {
  -- 		{ 'StalineEnc', vim.bo.fileencoding:upper() }, '  ',  -- Example for custom section
  -- 		{ 'StalineEnc', 'cool_symbol' }, ' ',                 -- the cool_symbol for your OS
  -- 		{ 'StalineGit', 'branch' }, ' ', '▊'                  -- Branch Name in different highlight
  -- 	}
  -- },
  defaults = {
    true_colors = true, -- LSP highlighing
    font_active = "none",
    branch_symbol = " ", -- Change the branch symbol
    mod_symbol = "  " -- Change the modified symbol
  },
  mode_icons = {
    ['n'] = 'NORMAL',
    ['no'] = 'NORMAL',
    ['nov'] = 'NORMAL',
    ['noV'] = 'NORMAL',
    ['niI'] = 'NORMAL',
    ['niR'] = 'NORMAL',
    ['niV'] = 'NORMAL',
    ['i'] = 'INSERT',
    ['ic'] = 'INSERT',
    ['ix'] = 'INSERT',
    ['s'] = 'INSERT',
    ['S'] = 'INSERT',
    ['v'] = 'VISUAL',
    ['V'] = 'VISUAL',
    [''] = 'VISUAL',
    ['r'] = 'REPLACE',
    ['r?'] = 'REPLACE',
    ['R'] = 'REPLACE',
    ['c'] = 'COMMAND',
    ['t'] = 'TERMINAL'
  },
  mode_colors = my_colors, -- Change mode colors
  special_table = {
    NvimTree = { 'File Explorer', ' ' },
    packer = { 'Packer', ' ' },
    TelescopePrompt = { 'Telescope', ' ' }
  },
  lsp_symbols = { Error = " ", Info = " ", Warn = " ", Hint = " " }
}
vim.cmd [[hi StalineBranch fg=#C4A7E7]]
vim.cmd [[hi StalineName fg=#EBBCBA]]
