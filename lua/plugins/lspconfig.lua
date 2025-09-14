-- lua/plugins/lspconfig.lua
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Capabilities for nvim-cmp
local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Configure the Java LSP server
lspconfig.jdtls.setup {
	settings = {
		java = {
		},
	},
	on_attach = function(client, bufnr)
		-- Key mappings and other setup
		-- Example: Go to definition, hover, etc.
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr })
		vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
		vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, { buffer = bufnr })
		vim.keymap.set('n', 'ds', vim.lsp.buf.document_symbol, { buffer = bufnr })
		-- Add more mappings as needed
	end,
	capabilities,
}

-- Configure rust-analyzer
lspconfig.rust_analyzer.setup({
	-- Path to rust-analyzer binary
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
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr })
		vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
		vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, { buffer = bufnr })
		vim.keymap.set('n', 'ds', vim.lsp.buf.document_symbol, { buffer = bufnr })
	end,
	capabilities,
})

lspconfig.lua_ls.setup {
	settings = {
	},
	on_attach = function(client, bufnr)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr })
		vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
		vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, { buffer = bufnr })
		vim.keymap.set('n', 'ds', vim.lsp.buf.document_symbol, { buffer = bufnr })
	end,
	capabilities,
}

lspconfig.pyright.setup {
	settings = {
	},
	on_attach = function(client, bufnr)
		-- Key mappings and other setup
		-- Example: Go to definition, hover, etc.
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
		-- Add more mappings as needed
	end,
	capabilities,
}

lspconfig.ts_ls.setup {
	settings = {
	},
	on_attach = function(client, bufnr)
		-- Key mappings and other setup
		-- Example: Go to definition, hover, etc.
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
		-- Add more mappings as needed
	end,
	capabilities,
}
