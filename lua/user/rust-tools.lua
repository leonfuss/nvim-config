local status_ok, rtools = pcall(require, "rust-tools")
if not status_ok then
	return
end

rtools.setup({})
