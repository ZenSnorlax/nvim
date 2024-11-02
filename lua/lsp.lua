
-- 在 packer 加载后再配置 LSP
require('lspconfig').pyright.setup{
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
            }
        }
    }
}


