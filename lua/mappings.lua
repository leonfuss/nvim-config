local nnoremap = function(l, r, silent)
  vim.api.nvim_set_keymap("n", l, r, {noremap = true, silent = silent})
end

local inoremap = function(l, r)
  vim.api.nvim_set_keymap("i", l, r , {noremap = true})
end

local vnoremap = function(l, r)
  vim.api.nvim_set_keymap("v", l, r , {noremap = true})
end

inoremap("jk", "<ESC>")
inoremap("kj", "<ESC>")

nnoremap("<Leader>w", ":w<CR>")
nnoremap("<Leader>c", ":Bdelete<CR>")
nnoremap("<Leader>h", ":noh<return><esc>",true)

nnoremap("<m-j>", ":resize -2<cr>",true)
nnoremap("<m-k>", ":resize +2<cr>",true)
nnoremap("<m-h>", ":vertical resize -2<cr>",true)
nnoremap("<m-l>", ":vertical resize +2<cr>",true)

-- clear any highlights an redraws the screen
nnoremap("<esc>", ":noh<return><esc>",true)

-- tab in normal mode cycles through the text buffer
nnoremap("<TAB>", ":bnext<CR>",true)
nnoremap("<S-TAB>", "bprevious<CR>",true)

-- better window navigation (CTRL-hjkl)
nnoremap("<C-h>", "<C-w>h",true)
nnoremap("<C-j>", "<C-w>j",true)
nnoremap("<C-k>", "<C-w>k",true)
nnoremap("<C-l>", "<C-w>l",true)

---------------
-- TELESCOPE --
---------------

nnoremap("<Leader>f",':lua require("telescope.builtin").find_files({})<CR>', true)
