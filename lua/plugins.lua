local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth' , '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	-- packer can manage itself
	use 'wbthomason/packer.nvim'		-- Packer can manage itself
	use 'ellisonleao/gruvbox.nvim'		-- Gruvbox Theme

	if packer_bootstrap then 
		require('packer').sync()
	end
end)
