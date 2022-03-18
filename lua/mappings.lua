local nnoremap = function(l, r, silent)
  vim.api.nvim_set_keymap("n", l, r, {noremap = true, silent = silent})
end
local inoremap = function(l, r)
  vim.api.nvim_set_keymap("i", l, r , {noremap = true})
end

local vnoremap = function(l, r)
  vim.api.nvim_set_keymap("v", l, r , {noremap = true})
end


-- easy insert mode exit
inoremap("jk", "<ESC>")
inoremap("kj", "<ESC>")

-- Basic leader keymaps
_G.whichkey.register({
    ['<leader>'] = {
        w = {"<cmd>w!<CR>", "save"},
        c = {"<cmd>Bdelete<CR>", "close"},
        h = {"<cmd>noh<return><esc>", "no highlight"},
    }
})
--
-- clear any highlights an redraws the screen
nnoremap("<esc>", ":noh<return><esc>",true)

-- tab in normal mode cycles through the text buffer
nnoremap("<TAB>", ":bnext<CR>",true)
nnoremap("<S-TAB>", "bprevious<CR>",true)

--------------------
-- CODING KEYMAPS --
--------------------

-- map "{" and "}" for easier access
inoremap("ö", "{")
inoremap("ä", "}")
vnoremap("ö", "{")
vnoremap("ä", "}")
nnoremap("ö", "{", true)
nnoremap("ä", "}", true)

-----------------------
-- WINDOW MANAGEMENT --
-----------------------

-- window creation
nnoremap("<C-w>h", ":split<CR>", true)
nnoremap("<C-w>v", ":vsplit<CR>", true)


-- window navigation (CTRL-hjkl)
nnoremap("<C-h>", "<C-w>h",true)
nnoremap("<C-j>", "<C-w>j",true)
nnoremap("<C-k>", "<C-w>k",true)
nnoremap("<C-l>", "<C-w>l",true)

-- window resize
nnoremap("<m-j>", ":resize -2<cr>",true)
nnoremap("<m-k>", ":resize +2<cr>",true)
nnoremap("<m-h>", ":vertical resize -2<cr>",true)
nnoremap("<m-l>", ":vertical resize +2<cr>",true)

---------------
-- TELESCOPE --
---------------

nnoremap("<Leader>f",':lua require("telescope.builtin").find_files({})<CR>', true)
nnoremap("<Leader>F",":Telescope file_browser<CR>", true)
