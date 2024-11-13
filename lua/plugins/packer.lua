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

      use {
        'simrat39/rust-tools.nvim',
        config = function()
          require('plugins.rust-tools')
        end
      }

    if packer_bootstrap then
      require('packer').sync()
    end
  end) 
