local cmp = require('cmp')

-- 设置全局补全项限制
vim.opt.pumheight = 15 -- 限制补全项数量为15

cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)  -- 使用 LuaSnip
        end,
    },
    mapping = {
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { 
            name = 'buffer',
            option = {
                max_item_count = vim.opt.pumheight:get(),  -- 限制最大补全项数
            }
        },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    sorting = {
        comparators = 
	{
            function(entry1, entry2)
                return entry1:get_completion_item().sortText < entry2:get_completion_item().sortText
            end,
        
    },
}
}
