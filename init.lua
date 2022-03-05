require "globals"
require "general"
require "mappings"

if pcall(require,"impatient") then
    require("impatient")
end

require "plugins"

require "config.feline"
require "config.cmp"
--require "config.lsp"
require "config.rust-tools"
-- require "user.options"
-- require "user.keymaps"
-- require "user.plugins"
-- require "user.colorscheme"
-- require "user.cmp"
-- require "user.lsp"
require "user.telescope"
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
require "user.telescope_extensions"

