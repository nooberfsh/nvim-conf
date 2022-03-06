-- https://github.com/akinsho/toggleterm.nvim

require('toggleterm').setup {
    size = function(term)
        if term.direction == "horizontal" then
            return 32
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
}

-- 水平
vim.keybinds.gmap("n", "<A-t>", "<cmd>ToggleTerm direction=horizontal<CR>", vim.keybinds.opts)
vim.keybinds.gmap("t", "<A-t>", "<cmd>ToggleTerm direction=horizontal<CR>", vim.keybinds.opts)
-- 垂直
vim.keybinds.gmap("n", "<A-T>", "<cmd>ToggleTerm direction=vertical<CR>", vim.keybinds.opts)
vim.keybinds.gmap("t", "<A-T>", "<cmd>ToggleTerm direction=vertical<CR>", vim.keybinds.opts)
