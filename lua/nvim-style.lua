vim.cmd('colorscheme nord')
vim.cmd('syntax enable')
require('nvim-autopairs').setup{}

require('lualine').setup({
	options = { theme = 'nord' }
})


require('bufferline').setup{}

require('bufferline').setup {
	options = {
		numbers = "none",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		separator_style = "slant",
		always_show_bufferline = true,
	}
}


