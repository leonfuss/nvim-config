local status,  rust_tools = pcall(require, "rust-tools")
if not status then
    error("rust-tools failed to load")
    return
end

local opts = {
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = {
            use_telescope = true
        },
    },
    server = {
        standalone = false,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                },
                rustfmt = {
                    extra_args = "+nightly"
                }
            }
        }
    }
}

rust_tools.setup(opts)

