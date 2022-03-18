local status, installer = pcall(require,"nvim-lsp-installer")
if not status then
    return
end

installer.on_server_ready(function (server)
   local opts = {
        on_attach = require("config.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    -- allow rust-tool to do is thing
    if server.name == "rust-analyzer" then
        return
    end

	if server.name == "sumneko_lua" then
	    local sumneko_opts = require("user.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end


    server:setup(opts)
end)
