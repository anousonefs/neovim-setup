local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    formatting.black.with({ extra_args = { "--fast" } }), -- format python
    --formatting.yapf, -- format python
    -- formatting.stylua, -- format lua
    -- formatting.gofumpt, -- format go
    -- diagnostics.revive, -- validate go
    diagnostics.flake8, -- validate python
    diagnostics.eslintr, -- validate typescript
    -- formatting.eslint, -- format typescript
  },
})
