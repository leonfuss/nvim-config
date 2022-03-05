local status, cmp = pcall(require,"cmp")
if not status then
    print("cmp failed to load")
    return
end

local snip_status, luasnip = pcall(require,"luasnip")
if not snip_status then
    print("luasnip failed to load")
    return
end

-- loads existing vs_code style plugins (friendly/snippets)
require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    }, 
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c'}),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c'}),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c'}),
        ["<CR>"] = cmp. mapping.confirm({ select = true })
    },
    sources = {
        { name = "nvim-lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "crates" },
        { name = "buffer" },
    },
    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
    experimental = {
        ghost_text = true
    }
})

-- setup cmdline competion
cmp.setup.cmdline(':', {
    sources = {
        { name = 'cmdline' }
    }
})

-- setup creates completion
local status_crates, crates = pcall(require, "crates")
if status_crates then
    crates.setup()
end
