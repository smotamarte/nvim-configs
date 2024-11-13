-- lua/plugins/treesitter.lua

return {
      require'nvim-treesitter.configs'.setup {
        -- Specify the languages you want to support
        ensure_installed = { "rust", "lua", "python", "javascript", "java" }, 
        highlight = {
          enable = true, -- Enable syntax highlighting
          additional_vim_regex_highlighting = false,  -- Only use Treesitter for highlighting
        },
      }
  }  
