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

The theme sets Neovim terminal colors and includes highlights for core UI, Treesitter, LSP semantic tokens, diagnostics, Telescope, nvim-cmp, gitsigns, and common file tree plugins.
