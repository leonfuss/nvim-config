vim.g.mapleader = ' '

vim.opt.syntax = 'enable'

-- Load plugins
require 'plugins'

-- Setup colorscheme
vim.opt.background = 'dark' -- or 'light'
vim.cmd([[colorscheme gruvbox]])

vim.opt.number = true
vim.o.relativenumber = true
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.cmdheight = 2
vim.opt.updatetime = 300 -- for better diagnostic experience
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.encoding = 'utf-8'
vim.opt.timeoutlen = 300
vim.opt.signcolumn = 'yes'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.autochdir = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.scrolloff = 4

-- improve search
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- Keymaps
local map = vim.keymap.set

map('i', 'jk', '<ESC>') -- better esc
map('i', 'kj', '<ESC>')
map({ 'n', 'v' }, 'L', '$') -- practical vertical navigation
map({ 'n', 'v' }, 'H', '^')
map({ 'n', 'v' }, 'ö', '{')
map({ 'n', 'v' }, 'ä', '}')

map({ 'v', 'n' }, '<C-h>', ':nohlsearch<cr>', { silent = true })

map('n', '<leader>w', ':w<cr>', { silent = true }) -- leader write
map('n', '<Tab>', ':bNext<cr>', { silent = true })

map('n', '<left>', ':bp<CR>', { silent = true })
map('n', '<right>', ':bn<CR>', { silent = true })

-- Treesitter setup
require('nvim-treesitter.configs').setup {
    ensure_installed = { 'rust', 'lua' },
    highlight = {
        enable = true
    }
}

-- Telescope setup
require('telescope').setup {
    pickers = {
        find_files = {
            theme = 'dropdown',
            previewer = false,

            mappings = {
                n = {
                    --['cd'] = function(prompt_bufnr)
                    --local selection = require('telescope.actions.state').get_selected_entry()
                    --local dir = vim.fn.fnamemodify(selection.path, ':p:h')
                    --require('telescope.actions').close(prompt_bufn)
                    --vim.cmd(string.format('silent lcd %s', dir))
                    --end
                }
            }
        },
        buffers = {
            theme = 'dropdown',
        }
    },
    extensions = { -- 'wild  | exact match        | Items that include "wild"
        fzf = { -- ^music | prefix exact match | Items that start with "music"
            fuzzy = true, -- .mp3$  | suffix exact match | Items that end with ".mp3"
            override_generic_sorter = true, -- !      | inverse match      | Match the inverse of the following statement
            override_file_sorter = true, -- pipe ('|') acts as OR
            case_mode = "smart_case", -- <Space> between two statements acts as AND
        }
    }
}

-- Telescope find_files centered dropdown list
map('n', '<C-f>', ':Telescope find_files<cr>', { silent = true })
map('n', '<leader>b', ':Telescope buffers<cr>', { silent = true })

require('telescope').load_extension('fzf') -- override sorter


-- CMP setup
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = true })
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
    experimental = {
        ghost_text = true
    }
})

-- LSP setup
require('nvim-lsp-setup').setup({
    installer = {},
    default_mappings = true,
    mappings = {},
    on_attach = function(client, _)
        require('nvim-lsp-setup.utils').format_on_save(client)
    end,
    servers = {
        sumneko_lua = require('lua-dev').setup({
            lspconfig = {
                on_attach = function(client, _)
                    require('nvim-lsp-setup.utils').disable_formatting(client)
                end
            }
        }),
        rust_analyzer = require('nvim-lsp-setup.rust-tools').setup({
            ['rust-analyzer'] = {
                cargo = {
                    allFeatures = true,
                },
                procMacro = {
                    enable = true,
                }
            },
        })
    }
})

require('fidget').setup({})

-- Feline setup (statusline)
--require('feline-config')
