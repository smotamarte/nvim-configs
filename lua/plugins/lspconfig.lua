-- No need to require 'lspconfig' anymore!
local util = require('lspconfig/util')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- 1. Setup capabilities
local capabilities = cmp_nvim_lsp.default_capabilities()

-- 2. Define a function to apply your settings
-- This replaces the old 'on_attach'
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        local opts = { buffer = bufnr }
        
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, opts)
        vim.keymap.set('n', 'ds', vim.lsp.buf.document_symbol, opts)
    end,
})

-- 3. Configure Servers using the NEW native API
local servers = {
    jdtls = {
        settings = { java = {} }
    },
    rust_analyzer = {
        root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
        settings = {
            ["rust-analyzer"] = {
                assist = { importGranularity = "crate", importPrefix = "by_self" },
                cargo = { loadOutDirsFromCheck = true },
                procMacro = { enable = true },
            },
        },
    },
    lua_ls = {
        settings = {
            Lua = { diagnostics = { globals = { 'vim' } } }
        }
    },
    pyright = {},
    ts_ls = {}
}

-- 4. Apply the configs
for name, config in pairs(servers) do
    config.capabilities = capabilities
    -- This is the new way (Neovim 0.11)
    vim.lsp.config(name, config)
    vim.lsp.enable(name)
end
