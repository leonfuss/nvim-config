local status, _ = pcall(require, "lspconfig")
if not status then
    return
end

require "config.lsp.lsp-installer"
require ("config.lsp.handlers").setup()
-- require "config.lsp.null-ls"

if pcall(require,"rust-tools") then
    require("config.lsp.rust-tools")
end

if pcall(require,"lua-dev") then
    require "config.lsp.lua-dev"
end
