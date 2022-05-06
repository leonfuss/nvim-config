local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

-- little autocommands for packer sync when writing to this buffer
local plugin_augroup = vim.api.nvim_create_augroup("Plugin.lua", { clear = true })
vim.api.nvim_create_autocmd({ "BufWrite" }, {
    pattern = { 'plugins.lua' },
    callback = function()
        vim.cmd [[source ~/.config/nvim/lua/plugins.lua]]
        require('packer').sync()
    end,
    group = plugin_augroup
})

return require('packer').startup({ function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim' -- Packer can manage itself
    use 'ellisonleao/gruvbox.nvim' -- Gruvbox Theme

    use 'nvim-lua/plenary.nvim' -- neat functions for nearly everything

    use 'nvim-telescope/telescope.nvim' -- imporving the whole experience
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'neovim/nvim-lspconfig' -- LSP realted
    use 'williamboman/nvim-lsp-installer' -- LSP installer
    use 'junnplus/nvim-lsp-setup' -- esay lsp setup
    use 'j-hui/fidget.nvim' -- nvim-lsp-progress spinner

    use 'hrsh7th/nvim-cmp' -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'

    use 'saadparwaiz1/cmp_luasnip' -- snippets :)
    use 'L3MON4D3/LuaSnip'

    use 'simrat39/rust-tools.nvim' -- one to rule them all
    use 'folke/lua-dev.nvim'

    use 'kyazdani42/nvim-web-devicons'

    use 'feline-nvim/feline.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end,
config = {
    display = {
        open_fn = require('packer.util').float,
    }
} })
