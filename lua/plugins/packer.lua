-- lua/plugins/packer.lua

-- Ensure Packer is installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
    end
    return false
  end
  
  local packer_bootstrap = ensure_packer()
  
  -- Packer startup function
  return require('packer').startup(function(use)
    -- Packer manages itself
    use 'morhetz/gruvbox'
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'neovim/nvim-lspconfig'

    use 'hrsh7th/nvim-cmp'    -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer'   -- Buffer source for nvim-cmp
    use 'hrsh7th/cmp-path'     -- Path source for nvim-cmp
    use 'hrsh7th/cmp-cmdline'  -- Cmdline source for nvim-cmp
    use 'hrsh7th/cmp-nvim-lua' -- Nvim-cmp source for Neovim Lua API (good for plugin dev)

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

     -- Neogit configuration
    use {
      'TimUntersberger/neogit',
      requires = {
        'nvim-lua/plenary.nvim', -- Required dependency
        'sindrets/diffview.nvim' -- Optional dependency for diff view
    },
    config = function()
      require('neogit').setup {
        -- Configuration options for Neogit
      }
    end
  }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
          require('plugins.treesitter') -- Ensure this line is added to load the Treesitter config
        end
      }
 
    if packer_bootstrap then
      require('packer').sync()
    end
  end) 
