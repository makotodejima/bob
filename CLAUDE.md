# Bob Colorscheme

A dark Neovim colorscheme with a green-tinted background and carefully balanced syntax highlighting. Originally built with lush.nvim, now converted to pure Lua for better performance and maintainability.

## Features

- Dark green-tinted background (`hsl(175, 22, 2)`)
- Comprehensive syntax highlighting for all major languages
- Full Tree-sitter support
- Plugin integrations (Telescope, GitSigns, LSP diagnostics, etc.)
- Terminal color definitions

## Structure

- `colors/bob.lua` - Main colorscheme entry point
- `lua/bob/init.lua` - Setup function and terminal colors
- `lua/bob/palette.lua` - Color definitions
- `lua/bob/highlights.lua` - Highlight group definitions
- `lua/bob/_legacy_bob.lua` - Original lush.nvim implementation (reference)

## Conversion Status

Converting from lush.nvim to pure Lua implementation using `vim.api.nvim_set_hl()` for modern Neovim compatibility.

