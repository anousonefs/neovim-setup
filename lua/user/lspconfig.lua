local ok, nvim_lsp = pcall(require, "lspconfig")
if not ok then
  vim.notify("import nvim-lspconfig failed")
  return
end
local custom_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) -- show documentation of variable, function
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) -- go to definition
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) -- go to type definition. my favorite
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) -- go to  implementation. my favorite
    vim.keymap.set("n", "ge", vim.diagnostic.goto_next, {buffer=0}) -- go to error definition. my favorite
    vim.keymap.set('n', 'gs', vim.lsp.buf.declaration,{buffer=0})
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0}) -- rename variable
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {buffer=0}) -- code action
    vim.keymap.set("n", ";u", "<cmd>Telescope lsp_references<cr>", {buffer=0}) -- show file that use this
    vim.keymap.set("n", ";e", "<cmd>Telescope diagnostics<cr>", {buffer=0}) -- go to error definition. my favorite
    vim.keymap.set("n", ";b", "<cmd>Telescope git_branches<cr>", {buffer=0}) -- show git branchs
  end

require("mason").setup {
     ui = {
         icons = {
             package_installed = "✓"
         }
     }
 }
require("mason-lspconfig").setup {
     ensure_installed = { "sumneko_lua" },
}

local opts = {
		on_attach = custom_attach,
}

-- go
nvim_lsp.gopls.setup(opts)

-- ts
nvim_lsp.tsserver.setup(opts)

-- python
-- nvim_lsp.pyright.setup(opts)

-- lua
local mylua = require("user.lsp.settings.sumneko_lua")
opts = vim.tbl_deep_extend("force", mylua, opts)
nvim_lsp.sumneko_lua.setup(opts)

