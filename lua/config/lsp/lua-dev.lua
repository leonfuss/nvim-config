local status, luadev = pcall(require, "lua-dev")
if not status then
    error("luadev failed to load")
    return

end

local lspconfig
status, lspconfig = pcall(require, "lspconfig")
if not status then
    error("lspconfig failed to load ")
    return
end

local luadev_setup = luadev.setup()
lspconfig.sumneko_lua.setup(luadev_setup)


