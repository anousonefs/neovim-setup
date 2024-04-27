--local colorscheme = "nightfox"
-- local colorscheme = "tokyonight"
--[[ local colorscheme = "PaperColor" ]]
local colorscheme = "nightfly"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
