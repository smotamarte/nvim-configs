-- lua/plugins/treesitter.lua

require('nvim-treesitter').setup({
  -- Specify the languages you want to support
  ensure_installed = { "rust", "lua", "python", "javascript", "java" },
})


