local status, _ = pcall(require, "lspconfig")
if not status then
    return
end

require "config.lsp.lsp-installer"
require ("config.lsp.handlers").setup()
-- require "config.lsp.null-ls"
