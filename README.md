# claude-code.nvim

A warm Claude-inspired colorscheme for Neovim.

"Library light, ink dark": cream paper and warm charcoal surfaces, a restrained terracotta accent, sage strings, and dusty-slate types.

## Install

### lazy.nvim

```lua
{
  "briancolclough/claude-code.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = "dark" -- or "light"
    vim.cmd.colorscheme("claude")
  end,
}
```

### Manual

Copy `colors/claude.lua` to `~/.config/nvim/colors/claude.lua`, then add:

```lua
vim.o.background = "dark" -- or "light"
vim.cmd.colorscheme("claude")
```

## Notes

The theme sets Neovim terminal colors and includes highlights for core UI, Treesitter, LSP semantic tokens, diagnostics, Telescope, nvim-cmp, blink.cmp, gitsigns, and common file tree plugins.

## Options

Set options before loading the colorscheme:

```lua
vim.g.claude_theme = {
  transparent = false,           -- make the main editor background transparent
  transparent_float = false,     -- floating windows: leave unset to inherit `transparent`, or force true/false
  transparent_telescope = true,  -- Telescope panels: leave unset to inherit `transparent_float`, or force true/false
}

vim.o.background = "dark" -- or "light"
vim.cmd.colorscheme("claude")
```

`transparent_float` and `transparent_telescope` are tri-state: when left unset
they inherit from `transparent` (and `transparent_float` respectively), but an
explicit `false` keeps a transparent main background while making floats or
Telescope panels opaque.

Completion menus and completion documentation use the editor background color, so they stay readable even when floating windows are transparent.
