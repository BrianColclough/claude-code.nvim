# AGENTS.md

Repo-specific guidance for AI agents working on `claude-code.nvim`.

## Project

- This is a small Neovim colorscheme repo. The runtime entrypoint is `colors/claude.lua`.
- Keep the plugin drop-in friendly: no build step, no plugin manager requirement, and no generated dependency tree.
- The public install surface is documented in `README.md`.

## Design System

- Treat `/Users/briancolclough/Downloads/Claude Code Theme — Design System/` as the visual source of truth.
- `.design-system/colors_and_type.css` may contain an ignored local copy of the design-system token file for easier diffing.
- The palette in `colors/claude.lua` mirrors `colors_and_type.css`; do not introduce new hex values unless the design system is updated first or the user explicitly asks for a repo-only experiment.
- Preserve the theme principles: warm paper/charcoal surfaces, sparse terracotta accent, readable muted comments, and syntax structure without confetti.

## Colorscheme Work

- Prefer adding highlight groups inside the existing `highlights(c)` table.
- Keep dark and light behavior token-driven through the existing palette keys.
- For Markdown support, cover both modern Treesitter `@markup.*` captures and older `@text.*` aliases when compatibility is useful.
- Verify changes with a headless load:

```sh
nvim --headless -u NONE +'set rtp^=.' +'set background=dark' +'colorscheme claude' +qa
nvim --headless -u NONE +'set rtp^=.' +'set background=light' +'colorscheme claude' +qa
```

## GitHub

- Use `gh` for GitHub operations.
- Run `gh auth status` before GitHub network operations and ask the user to re-authenticate if auth is missing or invalid.
