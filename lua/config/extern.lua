local status, plenary = pcall(require,"plenary")
if not status then
    return
end

local Path = plenary.path

local cwd = vim.fn.getcwd();
local p = Path:new{ cwd, ".nvim/init.lua"}

if not p:exists() then
    print("No extern neovim config found")
    return
end

print("extern config found ... sourcing")
vim.cmd(string.format("source %s", p:absolute()))
print("extern conifg successfully sourced")
