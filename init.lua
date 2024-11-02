vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)

	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'       -- 自动补全引擎
	use 'hrsh7th/cmp-nvim-lsp'   -- LSP 源
	use 'saadparwaiz1/cmp_luasnip' -- LuaSnip 源
	use 'L3MON4D3/LuaSnip'       -- Snippet 引擎
	use 'simrat39/rust-tools.nvim'  -- Rust 工具
	use 'windwp/nvim-autopairs'
	use 'shaunsingh/nord.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-lualine/lualine.nvim'
	use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
	use 'nvim-lua/plenary.nvim'
	use 'psliwka/vim-smoothie'   -- 平滑滚动
	use 'tpope/vim-fugitive'      -- Git 集成
	use 'numToStr/Comment.nvim'   -- 注释插件

end)

require('nvim-cmp')
require('lsp')
require('treesitter')
require('nvim-style')

vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.swapfile = false
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
