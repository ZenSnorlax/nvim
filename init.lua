
-- 引入 packer.nvim
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    -- Packer 管理自身
    use 'wbthomason/packer.nvim'

    -- LSP 配置
    use 'neovim/nvim-lspconfig'  -- LSP 配置

    -- nvim-cmp 自动补全
    use 'hrsh7th/nvim-cmp'       -- 自动补全引擎
    use 'hrsh7th/cmp-nvim-lsp'   -- LSP 源
    use 'saadparwaiz1/cmp_luasnip' -- LuaSnip 源
    use 'L3MON4D3/LuaSnip'       -- Snippet 引擎

    -- 其他有用的插件
    use 'psliwka/vim-smoothie'   -- 平滑滚动
    use 'tpope/vim-fugitive'      -- Git 集成
    use 'numToStr/Comment.nvim'   -- 注释插件
end)

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
                keyword_length = 3,  -- 仅在输入3个字符后才显示buffer补全
                max_item_count = vim.opt.pumheight:get(),  -- 限制最大补全项数
            }
        },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    sorting = {
        comparators = {
            function(entry1, entry2)
                return entry1:get_completion_item().sortText < entry2:get_completion_item().sortText
            end,
        },
    },
}

-- jk 映射为 Esc
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
