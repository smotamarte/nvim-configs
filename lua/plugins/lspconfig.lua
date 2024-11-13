-- lua/plugins/lspconfig.lua
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

-- Configure the Java LSP server
lspconfig.jdtls.setup {
  cmd = { '/opt/homebrew/bin/jdtls', '--jvm-heap', '1G' }, -- Replace 'java-lsp' with the path to jdtls if needed
  settings = {
  },
  on_attach = function(client, bufnr)
    -- Key mappings and other setup
    -- Example: Go to definition, hover, etc.
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
    -- Add more mappings as needed
  end,
}

-- Configure rust-analyzer
lspconfig.rust_analyzer.setup({
    -- Path to rust-analyzer binary
    cmd = { "rust-analyzer" },
    root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "crate",
          importPrefix = "by_self",
        },
        cargo = {
          loadOutDirsFromCheck = true,
        },
        procMacro = {
          enable = true,
        },
      },
    },
    on_attach = function(client, bufnr)
      -- Key mappings and other setup
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
      -- Add more mappings as needed
    end,
  })
