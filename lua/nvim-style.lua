-- 自动切换亮度模式函数
function SetLightDarkModeBasedOnTime()
    local hour = tonumber(os.date("%H"))
    if hour >= 9 and hour < 17 then
        vim.o.background = "light"  -- 白天使用亮色模式
    else
        vim.o.background = "dark"  -- 晚上使用暗色模式
    end
end

-- 在 Neovim 启动时检查时间并设置亮度模式
vim.cmd('autocmd VimEnter * lua SetLightDarkModeBasedOnTime()')

-- 启用语法高亮
vim.cmd('syntax enable')
-- 设置主题
vim.cmd('colorscheme nord')
-- 设置 nvim-autopairs 插件
require('nvim-autopairs').setup{}

-- 配置 lualine
require('lualine').setup({
    options = { theme = 'nord' }  -- 设置 lualine 使用 nord 主题
})

-- 配置 bufferline 插件
require('bufferline').setup{
    options = {
        numbers = "none",  -- 不显示 buffer 编号
        close_command = "bdelete! %d",  -- 关闭 buffer 命令
        right_mouse_command = "bdelete! %d",  -- 右键关闭 buffer
        left_mouse_command = "buffer %d",  -- 左键切换 buffer
        indicator_icon = '▎',  -- buffer 指示器图标
        buffer_close_icon = '',  -- buffer 关闭图标
        modified_icon = '●',  -- 修改标记图标
        close_icon = '',  -- 关闭图标
        separator_style = "slant",  -- buffer 之间的分隔符样式
        always_show_bufferline = true,  -- 总是显示 bufferline
    }
}
