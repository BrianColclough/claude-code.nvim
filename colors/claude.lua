-- ============================================================================
--  claude.nvim  —  a warm, elegant colorscheme inspired by claude.ai
--  "Library light, ink dark." Cream paper / warm charcoal, terracotta accents.
--
--  Install (lazy.nvim):
--      { dir = "~/.config/nvim/claude", name = "claude", lazy = false, priority = 1000 }
--  Or drop this file at:  ~/.config/nvim/colors/claude.lua
--
--  Usage:
--      vim.o.background = "dark"   -- or "light"
--      vim.cmd.colorscheme("claude")
-- ============================================================================

local M = {}

-- ---------------------------------------------------------------------------
-- Palettes  (mirror of colors_and_type.css)
-- ---------------------------------------------------------------------------
local palettes = {
  dark = {
    bg          = "#1E1C18", bg_dim     = "#191712", bg_float   = "#28251F",
    bg_hl       = "#26231C", bg_sel     = "#3A352B", bg_search  = "#5E4B33",
    border      = "#34302A", border_br  = "#4A443A",
    fg          = "#E8E2D4", fg_dim     = "#B8B0A0", fg_muted   = "#6E685B",
    fg_faint    = "#4A453C",
    accent      = "#D97757", accent_dim = "#B5634A", accent_soft= "#3A2A22",
    keyword     = "#E08A5F", func       = "#D6A95C", string     = "#94A36B",
    type        = "#8FAAC4", constant   = "#C68FA0", variable   = "#CDBFA6",
    property    = "#D9C7AC", operator   = "#C09B82", comment    = "#7C7565",
    builtin     = "#C99A8A", escape     = "#C68FA0",
    error       = "#D9645C", warning    = "#D8B468", info       = "#8FAAC4",
    hint        = "#88B0A8", success    = "#94A36B",
    add         = "#94A36B", change     = "#D8B468", delete     = "#D9645C",
    add_bg      = "#25281C", change_bg  = "#2A2620", delete_bg  = "#2E211F",
    none        = "NONE",
    term = { "#1E1C18","#D9645C","#94A36B","#D8B468","#8FAAC4","#C68FA0","#88B0A8","#E8E2D4",
             "#6E685B","#E0837C","#A8B585","#E2C684","#A6BDD2","#D4A6B4","#A2C2BB","#F4EFE3" },
  },
  light = {
    bg          = "#F0EEE6", bg_dim     = "#E8E5DA", bg_float   = "#FAF8F2",
    bg_hl       = "#E7E4D8", bg_sel     = "#DCD6C5", bg_search  = "#E7CFA0",
    border      = "#DAD5C7", border_br  = "#C7C0AE",
    fg          = "#3D3A33", fg_dim     = "#6B6657", fg_muted   = "#A39C8A",
    fg_faint    = "#C9C2B1",
    accent      = "#C15F3C", accent_dim = "#A44E30", accent_soft= "#EDDFD4",
    keyword     = "#C15F3C", func       = "#9A6B24", string     = "#5E6B3A",
    type        = "#3E6A8A", constant   = "#9C5A6E", variable   = "#5A5142",
    property    = "#4A4538", operator   = "#876E52", comment    = "#A39C8A",
    builtin     = "#A06A48", escape     = "#9C5A6E",
    error       = "#B5392F", warning    = "#9A6E1E", info       = "#3E6A8A",
    hint        = "#4A7E76", success    = "#5E7A3E",
    add         = "#5E7A3E", change     = "#9A6E1E", delete     = "#B5392F",
    add_bg      = "#E4EAD6", change_bg  = "#EDE6D2", delete_bg  = "#F1DED9",
    none        = "NONE",
    term = { "#3D3A33","#B5392F","#5E7A3E","#9A6E1E","#3E6A8A","#9C5A6E","#4A7E76","#F0EEE6",
             "#6B6657","#C15F3C","#6E8A48","#B0852E","#4E7DA0","#B06E82","#5A938A","#FAF8F2" },
  },
}

-- ---------------------------------------------------------------------------
-- Highlight specification
-- ---------------------------------------------------------------------------
local function highlights(c)
  return {
    -- Editor UI ------------------------------------------------------------
    Normal          = { fg = c.fg, bg = c.bg },
    NormalNC        = { fg = c.fg, bg = c.bg },
    NormalFloat     = { fg = c.fg, bg = c.bg_float },
    FloatBorder     = { fg = c.border_br, bg = c.bg_float },
    FloatTitle      = { fg = c.accent, bg = c.bg_float, bold = true },
    ColorColumn     = { bg = c.bg_dim },
    Cursor          = { fg = c.bg, bg = c.accent },
    lCursor         = { fg = c.bg, bg = c.accent },
    CursorLine      = { bg = c.bg_hl },
    CursorColumn    = { bg = c.bg_hl },
    CursorLineNr    = { fg = c.accent, bold = true },
    LineNr          = { fg = c.fg_faint },
    LineNrAbove     = { fg = c.fg_faint },
    LineNrBelow     = { fg = c.fg_faint },
    SignColumn      = { bg = c.none },
    FoldColumn      = { fg = c.fg_muted, bg = c.none },
    Folded          = { fg = c.fg_dim, bg = c.bg_dim },
    VertSplit       = { fg = c.border },
    WinSeparator    = { fg = c.border },
    EndOfBuffer     = { fg = c.bg },
    Visual          = { bg = c.bg_sel },
    VisualNOS       = { bg = c.bg_sel },
    Search          = { fg = c.fg, bg = c.bg_search },
    IncSearch       = { fg = c.bg, bg = c.accent },
    CurSearch       = { fg = c.bg, bg = c.accent },
    MatchParen      = { fg = c.accent, bold = true, underline = true },
    NonText         = { fg = c.fg_faint },
    SpecialKey      = { fg = c.fg_faint },
    Whitespace      = { fg = c.fg_faint },
    Conceal         = { fg = c.fg_muted },
    Directory       = { fg = c.type },
    Title           = { fg = c.accent, bold = true },
    ErrorMsg        = { fg = c.error },
    WarningMsg      = { fg = c.warning },
    ModeMsg         = { fg = c.fg_dim, bold = true },
    MoreMsg         = { fg = c.success },
    Question        = { fg = c.success },
    QuickFixLine    = { bg = c.bg_hl, bold = true },

    -- Statusline / Tabline -------------------------------------------------
    StatusLine      = { fg = c.fg_dim, bg = c.bg_float },
    StatusLineNC    = { fg = c.fg_muted, bg = c.bg_dim },
    TabLine         = { fg = c.fg_muted, bg = c.bg_dim },
    TabLineFill     = { bg = c.bg_dim },
    TabLineSel      = { fg = c.accent, bg = c.bg, bold = true },
    WinBar          = { fg = c.fg_dim, bg = c.none },
    WinBarNC        = { fg = c.fg_muted, bg = c.none },

    -- Popup menu -----------------------------------------------------------
    Pmenu           = { fg = c.fg_dim, bg = c.bg_float },
    PmenuSel        = { fg = c.fg, bg = c.accent_soft, bold = true },
    PmenuSbar       = { bg = c.bg_float },
    PmenuThumb      = { bg = c.border_br },
    PmenuKind       = { fg = c.type, bg = c.bg_float },
    PmenuExtra      = { fg = c.fg_muted, bg = c.bg_float },
    WildMenu        = { fg = c.bg, bg = c.accent },

    -- Syntax (legacy) ------------------------------------------------------
    Comment         = { fg = c.comment, italic = true },
    Constant        = { fg = c.constant },
    String          = { fg = c.string },
    Character       = { fg = c.string },
    Number          = { fg = c.constant },
    Boolean         = { fg = c.constant },
    Float           = { fg = c.constant },
    Identifier      = { fg = c.variable },
    Function        = { fg = c.func },
    Statement       = { fg = c.keyword },
    Conditional     = { fg = c.keyword },
    Repeat          = { fg = c.keyword },
    Label           = { fg = c.keyword },
    Operator        = { fg = c.operator },
    Keyword         = { fg = c.keyword },
    Exception       = { fg = c.keyword },
    PreProc         = { fg = c.builtin },
    Include         = { fg = c.keyword },
    Define          = { fg = c.keyword },
    Macro           = { fg = c.builtin },
    PreCondit       = { fg = c.builtin },
    Type            = { fg = c.type },
    StorageClass    = { fg = c.keyword },
    Structure       = { fg = c.type },
    Typedef         = { fg = c.type },
    Special         = { fg = c.escape },
    SpecialChar     = { fg = c.escape },
    Tag             = { fg = c.keyword },
    Delimiter       = { fg = c.operator },
    SpecialComment  = { fg = c.fg_muted, italic = true },
    Debug           = { fg = c.error },
    Underlined      = { underline = true },
    Bold            = { bold = true },
    Italic          = { italic = true },
    Ignore          = { fg = c.fg_faint },
    Error           = { fg = c.error },
    Todo            = { fg = c.bg, bg = c.warning, bold = true },

    -- Treesitter -----------------------------------------------------------
    ["@comment"]            = { link = "Comment" },
    ["@comment.documentation"] = { fg = c.comment, italic = true },
    ["@comment.error"]      = { fg = c.error },
    ["@comment.warning"]    = { fg = c.warning },
    ["@comment.todo"]       = { fg = c.bg, bg = c.warning, bold = true },
    ["@comment.note"]       = { fg = c.bg, bg = c.info, bold = true },
    ["@keyword"]            = { fg = c.keyword },
    ["@keyword.conditional"] = { fg = c.keyword },
    ["@keyword.conditional.ternary"] = { fg = c.operator },
    ["@keyword.coroutine"]  = { fg = c.keyword },
    ["@keyword.debug"]      = { fg = c.keyword },
    ["@keyword.directive"]  = { fg = c.builtin },
    ["@keyword.directive.define"] = { fg = c.accent },
    ["@keyword.function"]   = { fg = c.keyword },
    ["@keyword.modifier"]   = { fg = c.keyword },
    ["@keyword.operator"]   = { fg = c.operator },
    ["@keyword.repeat"]     = { fg = c.keyword },
    ["@keyword.return"]     = { fg = c.keyword, italic = true },
    ["@keyword.import"]     = { fg = c.keyword },
    ["@keyword.exception"]  = { fg = c.keyword },
    ["@conditional"]        = { fg = c.keyword },
    ["@repeat"]             = { fg = c.keyword },
    ["@function"]           = { fg = c.func },
    ["@function.call"]      = { fg = c.func },
    ["@function.method"]    = { fg = c.func },
    ["@function.method.call"] = { fg = c.func },
    ["@function.builtin"]   = { fg = c.builtin },
    ["@function.macro"]     = { fg = c.builtin },
    ["@constructor"]        = { fg = c.type },
    ["@string"]             = { fg = c.string },
    ["@string.documentation"] = { fg = c.comment, italic = true },
    ["@string.regex"]       = { fg = c.escape },
    ["@string.regexp"]      = { fg = c.escape },
    ["@string.escape"]      = { fg = c.escape },
    ["@string.special"]     = { fg = c.escape },
    ["@string.special.path"] = { fg = c.info },
    ["@string.special.symbol"] = { fg = c.constant },
    ["@string.special.url"] = { fg = c.info, underline = true },
    ["@character"]          = { fg = c.string },
    ["@character.special"]  = { fg = c.escape },
    ["@number"]             = { fg = c.constant },
    ["@float"]              = { fg = c.constant },
    ["@boolean"]            = { fg = c.constant },
    ["@constant"]           = { fg = c.constant },
    ["@constant.builtin"]   = { fg = c.constant },
    ["@constant.macro"]     = { fg = c.builtin },
    ["@variable"]           = { fg = c.variable },
    ["@variable.builtin"]   = { fg = c.builtin, italic = true },
    ["@variable.parameter"] = { fg = c.variable },
    ["@variable.parameter.builtin"] = { fg = c.builtin, italic = true },
    ["@variable.member"]    = { fg = c.property },
    ["@property"]           = { fg = c.property },
    ["@field"]              = { fg = c.property },
    ["@parameter"]          = { fg = c.variable },
    ["@type"]               = { fg = c.type },
    ["@type.builtin"]       = { fg = c.type, italic = true },
    ["@type.definition"]    = { fg = c.type },
    ["@namespace"]          = { fg = c.type },
    ["@module"]             = { fg = c.type },
    ["@module.builtin"]     = { fg = c.builtin },
    ["@operator"]           = { fg = c.operator },
    ["@punctuation"]        = { fg = c.operator },
    ["@punctuation.bracket"]= { fg = c.fg_dim },
    ["@punctuation.delimiter"] = { fg = c.operator },
    ["@punctuation.special"]= { fg = c.escape },
    ["@attribute"]          = { fg = c.func },
    ["@attribute.builtin"]  = { fg = c.builtin },
    ["@tag"]                = { fg = c.keyword },
    ["@tag.attribute"]      = { fg = c.func },
    ["@tag.builtin"]        = { fg = c.builtin },
    ["@tag.delimiter"]      = { fg = c.fg_muted },
    ["@text"]               = { fg = c.fg },
    ["@text.title"]         = { fg = c.accent, bold = true },
    ["@text.literal"]       = { fg = c.string },
    ["@text.uri"]           = { fg = c.info, underline = true },
    ["@text.emphasis"]      = { italic = true },
    ["@text.strong"]        = { bold = true },
    ["@label"]              = { fg = c.keyword },

    -- Markdown / markup ----------------------------------------------------
    ["@markup"]                    = { fg = c.fg },
    ["@markup.heading"]            = { fg = c.accent, bold = true },
    ["@markup.heading.1"]          = { fg = c.accent, bold = true },
    ["@markup.heading.2"]          = { fg = c.func, bold = true },
    ["@markup.heading.3"]          = { fg = c.type, bold = true },
    ["@markup.heading.4"]          = { fg = c.property, bold = true },
    ["@markup.heading.5"]          = { fg = c.variable, bold = true },
    ["@markup.heading.6"]          = { fg = c.fg_dim, bold = true },
    ["@markup.heading.delimiter"]  = { fg = c.fg_muted },
    ["@markup.strong"]             = { bold = true },
    ["@markup.italic"]             = { italic = true },
    ["@markup.strikethrough"]      = { strikethrough = true },
    ["@markup.underline"]          = { underline = true },
    ["@markup.raw"]                = { fg = c.string },
    ["@markup.raw.block"]          = { fg = c.fg_dim, bg = c.bg_dim },
    ["@markup.link"]               = { fg = c.info },
    ["@markup.link.label"]         = { fg = c.type },
    ["@markup.link.url"]           = { fg = c.info, underline = true },
    ["@markup.list"]               = { fg = c.accent },
    ["@markup.list.checked"]       = { fg = c.success },
    ["@markup.list.unchecked"]     = { fg = c.fg_muted },
    ["@markup.quote"]              = { fg = c.comment, italic = true },
    ["@markup.math"]               = { fg = c.constant },

    -- Older Treesitter aliases still used by some Markdown query sets.
    ["@text.title.1"]      = { link = "@markup.heading.1" },
    ["@text.title.2"]      = { link = "@markup.heading.2" },
    ["@text.title.3"]      = { link = "@markup.heading.3" },
    ["@text.title.4"]      = { link = "@markup.heading.4" },
    ["@text.title.5"]      = { link = "@markup.heading.5" },
    ["@text.title.6"]      = { link = "@markup.heading.6" },
    ["@text.quote"]        = { link = "@markup.quote" },
    ["@text.reference"]    = { link = "@markup.link" },
    ["@text.strike"]       = { link = "@markup.strikethrough" },
    ["@text.math"]         = { link = "@markup.math" },

    -- Legacy Vim syntax groups for Markdown without Treesitter.
    markdownHeadingDelimiter    = { fg = c.fg_muted },
    markdownH1                  = { link = "@markup.heading.1" },
    markdownH2                  = { link = "@markup.heading.2" },
    markdownH3                  = { link = "@markup.heading.3" },
    markdownH4                  = { link = "@markup.heading.4" },
    markdownH5                  = { link = "@markup.heading.5" },
    markdownH6                  = { link = "@markup.heading.6" },
    markdownBold                = { bold = true },
    markdownItalic              = { italic = true },
    markdownBoldItalic          = { bold = true, italic = true },
    markdownStrike              = { strikethrough = true },
    markdownCode                = { fg = c.string },
    markdownCodeBlock           = { fg = c.fg_dim, bg = c.bg_dim },
    markdownCodeDelimiter       = { fg = c.fg_muted },
    markdownBlockquote          = { link = "@markup.quote" },
    markdownListMarker          = { fg = c.accent },
    markdownOrderedListMarker   = { fg = c.accent },
    markdownRule                = { fg = c.fg_faint },
    markdownLinkText            = { fg = c.type },
    markdownLinkDelimiter       = { fg = c.fg_muted },
    markdownLinkTextDelimiter   = { fg = c.fg_muted },
    markdownUrl                 = { fg = c.info, underline = true },
    markdownEscape              = { fg = c.escape },

    -- LSP semantic tokens --------------------------------------------------
    ["@lsp.type.class"]     = { fg = c.type },
    ["@lsp.type.decorator"] = { fg = c.builtin },
    ["@lsp.type.enum"]      = { fg = c.type },
    ["@lsp.type.function"]  = { fg = c.func },
    ["@lsp.type.interface"] = { fg = c.type },
    ["@lsp.type.macro"]     = { fg = c.builtin },
    ["@lsp.type.method"]    = { fg = c.func },
    ["@lsp.type.namespace"] = { fg = c.type },
    ["@lsp.type.parameter"] = { fg = c.variable },
    ["@lsp.type.property"]  = { fg = c.property },
    ["@lsp.type.variable"]  = { fg = c.variable },

    -- Diagnostics ----------------------------------------------------------
    DiagnosticError         = { fg = c.error },
    DiagnosticWarn          = { fg = c.warning },
    DiagnosticInfo          = { fg = c.info },
    DiagnosticHint          = { fg = c.hint },
    DiagnosticOk            = { fg = c.success },
    DiagnosticUnderlineError= { undercurl = true, sp = c.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.hint },
    DiagnosticVirtualTextError = { fg = c.error, bg = c.delete_bg },
    DiagnosticVirtualTextWarn  = { fg = c.warning, bg = c.change_bg },

    -- Diff / Git -----------------------------------------------------------
    DiffAdd         = { bg = c.add_bg },
    DiffChange      = { bg = c.change_bg },
    DiffDelete      = { fg = c.delete, bg = c.delete_bg },
    DiffText        = { bg = c.change_bg, bold = true },
    diffAdded       = { fg = c.add },
    diffRemoved     = { fg = c.delete },
    diffChanged     = { fg = c.change },
    ["@diff.plus"]  = { fg = c.add },
    ["@diff.minus"] = { fg = c.delete },
    ["@diff.delta"] = { fg = c.change },
    GitSignsAdd     = { fg = c.add },
    GitSignsChange  = { fg = c.change },
    GitSignsDelete  = { fg = c.delete },

    -- Telescope ------------------------------------------------------------
    TelescopeNormal       = { fg = c.fg_dim, bg = c.bg_float },
    TelescopeBorder       = { fg = c.border_br, bg = c.bg_float },
    TelescopePromptNormal = { fg = c.fg, bg = c.bg_hl },
    TelescopePromptBorder = { fg = c.bg_hl, bg = c.bg_hl },
    TelescopePromptTitle  = { fg = c.bg, bg = c.accent, bold = true },
    TelescopeResultsTitle = { fg = c.bg_float, bg = c.bg_float },
    TelescopePreviewTitle = { fg = c.bg, bg = c.success, bold = true },
    TelescopeSelection    = { bg = c.accent_soft, bold = true },
    TelescopeMatching     = { fg = c.accent, bold = true },

    -- nvim-tree / neo-tree -------------------------------------------------
    NvimTreeNormal        = { fg = c.fg_dim, bg = c.bg_dim },
    NvimTreeFolderName    = { fg = c.type },
    NvimTreeFolderIcon    = { fg = c.accent },
    NvimTreeOpenedFolderName = { fg = c.type, bold = true },
    NvimTreeRootFolder    = { fg = c.accent, bold = true },
    NvimTreeGitDirty      = { fg = c.change },
    NvimTreeGitNew        = { fg = c.add },
    NvimTreeSpecialFile   = { fg = c.accent, underline = true },
    NeoTreeNormal         = { fg = c.fg_dim, bg = c.bg_dim },
    NeoTreeDirectoryName  = { fg = c.type },
    NeoTreeRootName       = { fg = c.accent, bold = true },

    -- nvim-cmp -------------------------------------------------------------
    CmpItemAbbr           = { fg = c.fg_dim },
    CmpItemAbbrMatch      = { fg = c.accent, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.accent },
    CmpItemKindFunction   = { fg = c.func },
    CmpItemKindVariable   = { fg = c.variable },
    CmpItemKindKeyword    = { fg = c.keyword },
    CmpItemKindClass      = { fg = c.type },
    CmpItemKindSnippet    = { fg = c.constant },

    -- Indent guides --------------------------------------------------------
    IndentBlanklineChar       = { fg = c.fg_faint },
    IblIndent                 = { fg = c.fg_faint },
    IblScope                  = { fg = c.border_br },

    -- Misc -----------------------------------------------------------------
    SpellBad        = { undercurl = true, sp = c.error },
    SpellCap        = { undercurl = true, sp = c.warning },
    SpellRare       = { undercurl = true, sp = c.info },
    SpellLocal      = { undercurl = true, sp = c.hint },
  }
end

-- ---------------------------------------------------------------------------
-- Loader
-- ---------------------------------------------------------------------------
function M.setup()
  local bg = (vim.o.background == "light") and "light" or "dark"
  local c = palettes[bg]

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
  vim.o.termguicolors = true
  vim.g.colors_name = "claude"

  for group, spec in pairs(highlights(c)) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  for i, color in ipairs(c.term) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

M.setup()
return M
