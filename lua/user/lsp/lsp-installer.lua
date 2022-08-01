local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	 if server.name == "jsonls" then
    vim.notify("found jsonls")
	 	local jsonls_opts = require("user.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if server.name == "sumneko_lua" then
    vim.notify("found sumneko lua")
	 	local sumneko_opts = require("user.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	 if server.name == "pyright" then
    vim.notify("found pyright")
	 	local pyright_opts = require("user.lsp.settings.pyright")
	 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	 end

	 if server.name == "gopls" then
    vim.notify("found gopls")
	 	local gopls_opts = require("user.lsp.settings.gopls")
	 	opts = vim.tbl_deep_extend("force", gopls_opts, opts)
	 end

	 if server.name == "tsserver" then
    vim.notify("found tsserver")
	 	local tsserver_opts = require("user.lsp.settings.tsserver")
	 	opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	 end


	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
