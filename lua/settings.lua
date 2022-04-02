-- 设定各种文本的字符编码
vim.o.encoding = "utf-8"

-- 是否高亮当前文本行
vim.o.cursorline = true

-- 是否开启 xterm 兼容的终端 24 位色彩支持
vim.o.termguicolors = true

-- 是否显示绝对行号
vim.o.number = true

-- 是否开启自动缩进
vim.o.autoindent = true
-- 设定自动缩进的策略为 plugin
vim.o.filetype = "plugin"

-- 是否特殊显示空格等字符
vim.o.list = true

-- 是否允许缓冲区未保存时就切换
vim.o.hidden = true

-- 向左向下生成窗口
vim.o.splitright = true
vim.o.splitbelow = true

-- 设定光标上下两侧最少保留的屏幕行数
vim.o.scrolloff = 10

-- 自动切换输入法（Fcitx5 框架）
vim.g.FcitxClose = function()
    -- display fcitx state, 0 for close, 1 for inactive, 2 for active
    local input_status = tonumber(vim.fn.system("fcitx5-remote"))
    if input_status == 2 then
        vim.fn.system("fcitx5-remote -c")
    end
end
vim.cmd("autocmd InsertLeave * call FcitxClose()")
