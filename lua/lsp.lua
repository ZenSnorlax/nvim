
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Python LSP
require('lspconfig').pyright.setup{
	capabilities = capabilities,
}

-- C/C++ LSP
require('lspconfig').clangd.setup{
	capabilities = capabilities,
}

require('rust-tools').setup {
	tools = {
		autoSetHints = true,
		inlay_hints = {
			show_variable_name = true,
			show_parameter_hints = true,
			highlight = "LspInlayHint",
			parameter_hints_prefix = "🛈 ",
			variable_hints_prefix = "🡕 ",
			other_hints_prefix = "🞂 ",
		},
	},
}
-- Commands:
-- RustEnableInlayHints
-- RustDisableInlayHints
-- RustSetInlayHints
-- RustUnsetInlayHints

-- Set inlay hints for the current buffer
require('rust-tools').inlay_hints.set()
-- Unset inlay hints for the current buffer
require('rust-tools').inlay_hints.unset()

-- Enable inlay hints auto update and set them for all the buffers
require('rust-tools').inlay_hints.enable()
-- Disable inlay hints auto update and unset them for all buffers
require('rust-tools').inlay_hints.disable()
