local status, lspsaga = pcall(require, 'lspsaga')
if not status then
    print("LspSaga failed to load")
    return
end

lspsaga.setup()

_G.whichkey.register({
    ['K'] = {"<cmd>lua require('lspsaga.hover').render_hover_docs()<CR>", "Documentation"},
    ['<C-k>'] = { "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", "signature help"},
    ['<c-f>'] = {"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(4)<CR>", "scroll down lspsaga docs"},
    ['<c-b>'] = {"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-4)<CR>", "scroll up lspsaga docs"},
    ['gl'] = {"<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", "line diagnostics"},
    ['gL'] = {"<cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostics()<CR>", "cursor diagnostics"},
    ['<leader>'] = {
        l = {
            name = "+LSP",
            a = { "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", "code actions"},
            r = { "<cmd>lua require('lspsaga.rename').rename()<CR>", "rename"},
            d = { "<cmd>lua require('lspsaga.provider').preview_definition()<CR>", "preview definition"},
            n = { "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>", "next diagnostic"},
            b = { "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>", "prev diagnostic"},
        }
    }
})
