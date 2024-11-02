
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Python LSP
require('lspconfig').pyright.setup{
    capabilities = capabilities,
}

-- C/C++ LSP
require('lspconfig').clangd.setup{
    capabilities = capabilities,
}

-- Rust LSP with rust-tools
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
        }
     
},
}
--lua
require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'},  -- 允许使用vim全局变量
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),  -- 添加运行时库
            },
            telemetry = {
                enable = false,  -- 禁用遥测
            },
        },
    },
})
