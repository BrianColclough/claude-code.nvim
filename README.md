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
  transparent_float = false,     -- make floating windows and completion menus transparent
  transparent_telescope = true,  -- make Telescope panels transparent
  completion_blend = 8,          -- blend autocomplete popup backgrounds
}

vim.o.background = "dark" -- or "light"
vim.cmd.colorscheme("claude")
```

For a blurred or glassy Telescope effect, pair the transparent highlights with plugin blend settings:

```lua
require("telescope").setup({
  defaults = {
    winblend = 10,
  },
})
```

`completion_blend` uses Neovim's popup-menu blending for autocomplete menus. Neovim highlights can make float backgrounds transparent and blendable, but true blur depends on your terminal or GUI.
