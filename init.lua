---------------------
-- General Setting --
---------------------

require "globals"
require "general"

require "config.whichkey"       -- initialize keymap

require "mappings"

-------------
-- Packker --
-------------

require "plugins"

-------------------
-- startup speed --
-------------------

if pcall(require,"impatient") then
    require("impatient")
end

----------------------
-- Plugins specific --
----------------------

require "config.feline"         -- statusline
require "config.cmp"            -- completion
require "config.lsp"            -- LSP
require "config.lspsaga"        -- Pretier Lsp
require "config.comment"        -- Commment.nvim
require "config.telescope"      -- Telescope
require "config.fidget"         -- LSP Server progress indicator


-- require "user.telescope"
require "user.treesitter"
require "user.autopairs"
-- require "user.comment"
require "user.gitsigns"
-- require "user.nvim-tree"
require "user.bufferline"
-- require "user.lualine"
-- require "user.toggleterm"
require "user.project"
-- require "user.impatient"
require "user.indentline"
require "user.alpha"
-- require "user.whichkey"
-- require "user.autocommands"
-- require "user.rusc-tools"
-- require "user.telescope_extensions"

------------------------------------
-- Source project specific config --
------------------------------------
require "config.extern"
