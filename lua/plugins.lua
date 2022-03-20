------------------
-- Packer Setup --
------------------

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Reload neovim whenever "plugins.lua" is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Protected call for first startup
local status_ok_packer, packer = pcall(require, "packer")
if not status_ok_packer then
  return
end

-- Packer - floating window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-------------
-- Plugins --
-------------
packer.startup(function(use)
    -- Packer
    use("wbthomason/packer.nvim")

    -- Colorscheme
    use "lunarvim/darkplus.nvim"

    -- Foundation
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "lewis6991/impatient.nvim"

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-file-browser.nvim"       -- install fd for that
    use "nvim-telescope/telescope-ui-select.nvim"
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    use "nvim-telescope/telescope-project.nvim"
    use "ahmedkhalf/project.nvim"                           -- Project finder

    -- Completion engine (cmp)
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-buffer"
    use "saecki/crates.nvim"            -- Rust .toml completion
    use "folke/trouble.nvim"            -- pretty diagnostics list
    use "tami5/lspsaga.nvim"            -- pretty ui
    use "onsails/lspkind-nvim"          -- vs code pictograms

    -- Snippets
    use "L3MON4D3/LuaSnip"              -- Snippet Engine (LuaSnip)
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    -- LSP (=Language Server Protocol)
    use "neovim/nvim-lspconfig"
    use "nvim-lua/lsp_extensions.nvim"
    use "williamboman/nvim-lsp-installer"
    use "j-hui/fidget.nvim"             -- LSP Server progress indicator

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Comment
    use "numToStr/Comment.nvim"

    -- Autopairs
    use "windwp/nvim-autopairs"

    -- Keymaps
    use "folke/which-key.nvim"

    ----------------------
    -- Language related --
    ----------------------

    -- Lua
    use "folke/lua-dev.nvim"

    -- Rust
    use "simrat39/rust-tools.nvim"

    ----------------
    -- Aesthetics --
    ----------------

    use "kyazdani42/nvim-web-devicons"          -- Nvim "designer" icons
    use "lukas-reineke/indent-blankline.nvim"   -- VSCode like visual indention helper
    use "akinsho/bufferline.nvim"
    use "kosayoda/nvim-lightbulb"               -- VSCode linke code-action lightbulb
    use "famiu/bufdelete.nvim"                  -- keep layout even when deleting buffers
    use "feline-nvim/feline.nvim"               -- statusbar

    -------------------------------------------------------------------
    -- Setup - Automatically set up config after cloning packer.nvim --
    -------------------------------------------------------------------
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end

end)

_G.whichkey.register({
    ['<leader>'] = {
        p = {
            name = "Packer",
            c = { "<cmd>PackerCompile<cr>", "Compile" },
            i = { "<cmd>PackerInstall<cr>", "Install" },
            s = { "<cmd>PackerSync<cr>", "Sync" },
            S = { "<cmd>PackerStatus<cr>", "Status" },
            u = { "<cmd>PackerUpdate<cr>", "Update" },
        },
    }
})
