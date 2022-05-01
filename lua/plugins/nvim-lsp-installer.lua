-- https://github.com/williamboman/nvim-lsp-installer

local lsp_installer_servers = require('nvim-lsp-installer.servers')

-- WARN: 手动书写 LSP 配置文件
-- 名称：https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- 配置：https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local servers = {
    -- 语言服务器名称：配置选项
    sumneko_lua = require('lsp.sumneko_lua'),
    rust_analyzer = require('lsp.rust_analyzer'),
    hls = require('lsp.haskell_hls'),
    svls = require('lsp.system_verilog_svls'),
}

-- 这里是 LSP 服务启动后的按键加载
local function attach(_, bufnr)
    vim.keybinds.bmap(bufnr, "n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, "n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, "n", "<leader>go", "<cmd>Telescope diagnostics<CR>", vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, "n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, "n", "<leader>gs", "<cmd>Telescope lsp_document_symbols<CR>", vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, "n", "<leader>ca", "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", vim.keybinds.opts)

    -- 变量重命名（代替内置 LSP 的窗口，Lspsaga 让变量重命名更美观）
    vim.keybinds.bmap(bufnr, "n", "<leader>cn", "<cmd>Lspsaga rename<CR>", vim.keybinds.opts)
    -- 查看帮助信息（代替内置 LSP 的窗口，Lspsaga 让查看帮助信息更美观）
    vim.keybinds.bmap(bufnr, "n", "<leader>gh", "<cmd>Lspsaga hover_doc<CR>", vim.keybinds.opts)
    -- 跳转到上一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    vim.keybinds.bmap(bufnr, "n", "<leader>g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", vim.keybinds.opts)
    -- 跳转到下一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    vim.keybinds.bmap(bufnr, "n", "<leader>g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", vim.keybinds.opts)
    -- 悬浮窗口上翻页，由 Lspsaga 提供
    vim.keybinds.bmap(
        bufnr,
        "n",
        "<C-p>",
        "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
        vim.keybinds.opts
    )
    -- 悬浮窗口下翻页，由 Lspsaga 提供
    vim.keybinds.bmap(
        bufnr,
        "n",
        "<C-n>",
        "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
        vim.keybinds.opts
    )
end

-- 自动安装或启动 LanguageServers
for server_name, server_options in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    -- 判断服务是否可用
    if server_available then
        -- 判断服务是否准备就绪，若就绪则启动服务
        server:on_ready(
            function()
                -- 使用 cmp_nvim_lsp 代替内置 omnifunc，获得更强的补全体验
                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
                -- 代替内置 omnifunc
                server_options.capabilities = capabilities

                -- keybind
                server_options.on_attach = attach

                -- options config
                server_options.flags = {
                    debounce_text_changes = 150
                }
                -- https://github.com/williamboman/nvim-lsp-installer/wiki/Rust
                if server_name == 'rust_analyzer' then
                    local rust_config = require('plugins.rust-tools')
                    require("rust-tools").setup {
                        tools = rust_config.tools,
                        server = vim.tbl_deep_extend("force", server:get_default_options(), server_options),
                    }
                else
                    -- 启动服务
                    server:setup(server_options)
                end
            end
        )
        -- 如果服务器没有下载，则通过 notify 插件弹出下载提示
        if not server:is_installed() then
            vim.notify("Install Language Server : " .. server_name, "WARN", {title = "Language Servers"})
            server:install()
        end
    end
end
