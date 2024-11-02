require'nvim-treesitter.configs'.setup {
    ensure_installed = { "python" ,"cpp","c", "rust"}, 
    highlight = {
        enable = true,              -- 启用高亮
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,              -- 启用缩进
    },
}

