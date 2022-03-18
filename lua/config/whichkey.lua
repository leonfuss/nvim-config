local M = {}

M.check_status = function()
    local status, wk = pcall(require, 'which-key')
    if status then
        local opts = {
            icons = {
                breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                separator = "➜", -- symbol used between a key and it's label
                group = "+", -- symbol prepended to a group
            },window = {
                border = "rounded", -- none, single, double, shadow
                position = "bottom", -- bottom, top
                margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                winblend = 0,
            },
        }
        wk.setup(opts)
        M.status = "initialized"
    else
        M.status = 'not_available'
    end
end

M.register = function(mappings,opts)
    if M.status == 'uninitialized' then
        M.check_status()
        M.register(mappings,opts)
    elseif M.status == 'not_available' then
        return
    end
    require("which-key").register(mappings, opts)
end

_G.whichkey = M

