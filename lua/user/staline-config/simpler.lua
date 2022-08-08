require "staline".setup {
  sections = {
    left = { ' ', 'mode', 'left_sep_double', 'branch', ' ', 'lsp' },
    mid = { 'file_name' },
    right = { 'right_sep_double', 'line_column', 'file_size' }
  },
  mode_colors = { n = "#EBBCBA", i = "#C4A7E7", c = "#9CCFD8", v = "#F6C177", V = "#F6C177" },
  mode_icons = {
    n = " NORMAL",
    i = " INSERT",
    c = " COMMAND",
    v = " VISUAL",
    V = " VISUAL"
  },
  defaults = {
    true_colors = true,
    line_column = " [%l/%L] :%c  ",
    branch_symbol = " ",
    full_path = true,
    left_separator = "",
    right_separator = "",
    -- cool_symbol = " ", -- Change this to override defult OS icon.
    mod_symbol = "  ", -- Change the modified symbol
    lsp_client_symbol = " ",
  },
  special_table = {
    NvimTree = { 'NvimTree', ' ' },
    packer = { 'Packer', ' ' } -- etc
  },
  lsp_symbols = { Error = " ", Info = " ", Warn = " ", Hint = "" }
}
vim.cmd [[hi StalineBranch guifg=#C4A7E7]]
vim.cmd [[hi StalineName guifg=#EBBCBA]]
