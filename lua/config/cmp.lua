local status, cmp = pcall(require,"cmp")
if not status then
    error("cmp failed to load")
    return
end

local snip_status, luasnip = pcall(require,"luasnip")
if not snip_status then
    error("luasnip failed to load")
    return
end

local lspkind_status, lspkind = pcall(require,"lspkind")
if not lspkind_status then
    error("lspkind failed to load")
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
              ["<CR>"] = cmp. mapping.confirm({ select = true })
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "crates" },
        { name = "buffer" },
    },
    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text" ,
            menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                path = "[Path]"
            })
        })
    },
    experimental = {
        ghost_text = true
    }
})

-- setup cmdline competion
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = "path" }
    },
    {
        { name = "cmdline" }
    }
    )

})

-- setup search completion
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" }
    }
})

-- setup creates completion
local status_crates, crates = pcall(require, "crates")
if status_crates then
    crates.setup()
end
