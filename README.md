# Neovim Configuration

This is a personal Neovim configuration tailored for development in several languages. It uses `packer.nvim` for plugin management.

## Prerequisites

Before you begin, ensure you have the following installed:

*   **Neovim (v0.8.0+):** The editor itself.
*   **Git:** For cloning this repository and for plugin management.
*   **A C compiler:** For building some plugins and Treesitter parsers.

## Installation

1.  **Clone the repository:**
    ```bash
    git clone <repository-url> ~/.config/nvim
    ```
2.  **Start Neovim:**
    Open Neovim. The first time you do, `packer.nvim` will automatically install itself and all the configured plugins.
3.  **Sync Plugins:**
    Run the `:PackerSync` command in Neovim to ensure all plugins are installed and up-to-date.

## Dependencies

This configuration relies on several external dependencies for full functionality.

### Language Servers (LSPs)

You need to install the following language servers for their respective languages:

*   **Java:** `jdtls`
*   **Rust:** `rust-analyzer`
*   **Lua:** `lua-language-server`
*   **Python:** `pyright`
*   **TypeScript:** `typescript-language-server`

You can typically install these using your system's package manager (e.g., `brew`, `apt`) or a language-specific package manager (e.g., `npm`, `pip`).

### Treesitter Parsers

The following Treesitter parsers are required for syntax highlighting and code analysis. They should be installed automatically by `nvim-treesitter` when you open a relevant file for the first time.

*   `rust`
*   `lua`
*   `python`
*   `javascript`
*   `java`

## Recommended Tools

*   **ripgrep:** For significantly faster searching with Telescope.
*   **Nerd Font:** To correctly display icons in the UI.
