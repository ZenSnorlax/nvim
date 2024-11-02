require('nvim-cmp')
require('lsp')
require('treesitter')
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

	-- 显示行号
	use 'windwp/nvim-autopairs'

	use 'nvim-treesitter/nvim-treesitter'
	-- 其他有用的插件
	use 'psliwka/vim-smoothie'   -- 平滑滚动
	use 'tpope/vim-fugitive'      -- Git 集成
	use 'numToStr/Comment.nvim'   -- 注释插件

end)

vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd('colorscheme vim')
vim.cmd('syntax enable')
require('nvim-autopairs').setup{}


-- jk 映射为 Esc
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
