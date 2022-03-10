-- https://github.com/simrat39/rust-tools.nvim
--


vim.keybinds.gmap("n", "<leader>rr", "<cmd>RustRunnables<CR>", vim.keybinds.opts)

-- setup 过程在 nvim-lsp-installer 中进行
return {
    tools = {
        runnables = {
            -- whether to use telescope for selection menu or not
            use_telescope = true,

            -- rest of the opts are forwarded to telescope
        },
    },
    dap = {}
}


