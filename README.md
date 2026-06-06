# Neovim Configuration Dependencies

This is a list of all dependencies and plugins configured on top of vanilla Neovim (`v0.8.0+`) for this setup.

## 1. External & System Dependencies

These tools are installed via your system package manager (e.g., `brew`, `apt`, `pacman`) or language-specific managers:

### System Utilities
*   **Git**: Required for cloning the configuration and plugin management.
*   **C Compiler** (`gcc` or `clang`): Required for building Treesitter parsers and certain plugins.
*   **ripgrep** (`rg`): Required for high-performance fuzzy searching with Telescope.
*   **Nerd Font**: Highly recommended to correctly display file and UI icons.

### Language Servers (LSPs)
*   **Java**: `jdtls`
*   **Rust**: `rust-analyzer`
*   **Lua**: `lua-language-server`
*   **Python**: `pyright`
*   **TypeScript / JavaScript**: `typescript-language-server`

---

## 2. Neovim Plugins (Packer)

These plugins are managed by `packer.nvim` and extend Neovim's default editing capabilities:

### Plugin & Package Management
*   [packer.nvim](https://github.com/wbthomason/packer.nvim) – Plugin manager for Neovim.

### Color & UI Theme
*   [gruvbox](https://github.com/morhetz/gruvbox) – Retro groove color scheme.

### Libraries & API Extensions
*   [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) – Standard Lua functions library used by Telescope and Neogit.

### Language Server Protocol (LSP)
*   [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) – Quickstart configurations for the Neovim LSP client.
*   [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim) – Inject LSP diagnostics, code actions, and formatting.

### Autocompletion (nvim-cmp)
*   [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) – Autocompletion engine.
*   [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) – LSP completion source.
*   [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) – Buffer words completion source.
*   [cmp-path](https://github.com/hrsh7th/cmp-path) – File system paths completion source.
*   [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) – Command line completion source.
*   [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) – Neovim Lua API completion source.

### Fuzzy Finder & Search
*   [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) – Highly extensible fuzzy finder over lists.

### Git Integration
*   [neogit](https://github.com/TimUntersberger/neogit) – Magit clone for Neovim.
*   [diffview.nvim](https://github.com/sindrets/diffview.nvim) – Single-tab git diff view.

### Treesitter & Syntax Highlighting
*   [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) – Incremental parsing library for syntax highlighting.
    *   *Installed Parsers*: `rust`, `lua`, `python`, `javascript`, `java`
