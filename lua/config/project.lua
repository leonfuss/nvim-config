local status, project = pcall(require,"project_nvim")
if not status then
    print("Project.nvim could not be loaded")
    return
end

project.setup({
	on_config_done = nil,
    manual_mode = false,

	---@usage Methods of detecting the root directory
	--- Allowed values: **"lsp"** uses the native neovim lsp
	--- **"pattern"** uses vim-rooter like glob pattern matching. Here
	--- order matters: if one is not detected, the other is used as fallback. You
	--- can also delete or rearangne the detection methods.
	-- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
	detection_methods = { "pattern" },
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
	show_hidden = true,
	silent_chdir = true,
	ignore_lsp = {},
	---@usage path to store the project history for use in telescope
    datapath = vim.fn.stdpath("data"),
})
