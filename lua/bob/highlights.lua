local p = require("bob.palette")
local u = require("bob.utilities")

return {
  -- Base groups
  Normal = { fg = p.text, bg = p.base },
  NormalNC = { fg = p.text, bg = p.base },
  NormalFloat = { bg = p.highlight_high },

  -- UI elements
  ColorColumn = { bg = p.highlight_med },

  Cursor = { reverse = true },
  CursorLine = { bg = p.highlight_low },
  CursorColumn = { bg = p.highlight_low },
  CursorLineNr = { fg = "#57647f", bg = p.highlight_low },

  -- Search
  IncSearch = { bg = p.emerald, fg = u.darken(p.emerald, 80) },
  CurSearch = { link = "IncSearch" },
  Search = { bg = p.subtle },
  Substitute = { link = "IncSearch" },

  ModeMsg = { fg = p.off_white },

  MatchParen = { bold = true, underline = true },

  -- Fugitive inline diff
  diffAdded = { bg = p.diff_added_bg },
  diffRemoved = { bg = p.diff_deleted_bg },
  -- diffLine = { fg = "#a2926c" },
  -- diffNoEOL = { fg = "#a2926c" },
  TreesitterContext = { bg = p.highlight_med },

  -- Diff
  DiffAdd = { bg = p.diff_added_bg },
  DiffDelete = { bg = p.diff_deleted_bg },
  DiffChange = { bg = p.highlight_low },
  DiffText = { bg = u.lighten(p.diff_added_bg, 2) },

  -- Line numbers
  LineNr = { fg = "#363c49" }, -- From legacy LineNr
  LineNrAbove = { link = "LineNr" },
  LineNrBelow = { link = "LineNr" },

  -- Statusline
  StatusLine = { bg = p.highlight_med },
  StatusLineNC = { bg = p.highlight_low },

  -- Visual
  Visual = { bg = p.subtle }, -- From legacy Visual
  VisualNOS = { link = "Visual" },

  -- Popups
  Pmenu = { bg = "#323232" }, -- From legacy Pmenu
  PmenuSel = { bg = "#273953" }, -- From legacy Visual (PmenuSel links to Visual)
  PmenuSbar = { bg = "#323232" }, -- From legacy PmenuSbar
  PmenuThumb = { bg = "#464646" }, -- From legacy PmenuThumb

  -- Borders
  FloatBorder = { bg = "#323232" }, -- From legacy FloatBorder
  WinSeparator = { fg = "#2c323c", bg = "#080e07" }, -- From legacy WinSeparator

  -- Messages
  ErrorMsg = { fg = "#ffffff", bg = "#b1501b" }, -- From legacy ErrorMsg
  WarningMsg = { fg = p.red },
  Question = { fg = "green", bold = true }, -- From legacy Question

  -- Syntax highlighting
  Comment = { fg = p.muted, italic = true },

  Constant = { fg = p.text },
  String = { fg = p.wheat },
  Character = { link = "Constant" },
  Number = { fg = p.text },
  Boolean = { fg = p.text, bold = true },
  Float = { link = "Number" },

  Identifier = { fg = p.text },
  Function = { fg = p.off_white },

  Statement = { fg = p.smooth_blue },
  Conditional = { fg = p.smooth_blue },
  Repeat = { link = "Statement" },
  Label = { link = "Statement" },
  Operator = { fg = p.smooth_blue },
  Keyword = { fg = p.green },
  Exception = { link = "Keyword" },

  PreProc = { fg = p.smooth_blue, bold = true },
  Include = { fg = p.smooth_blue },
  Define = { fg = p.smooth_blue, bold = true },
  Macro = { fg = p.smooth_blue, bold = true },
  PreCondit = { fg = p.smooth_blue, bold = true },

  Type = { fg = p.wheat },
  StorageClass = { link = "Type" },
  Structure = { link = "Type" },
  Typedef = { link = "Type" },

  Special = { fg = p.ash },
  SpecialChar = { fg = p.accent_blue },
  Tag = { link = "Special" },
  Delimiter = { link = "Special" },
  SpecialComment = { link = "Special" },
  Debug = { link = "Special" },

  -- Diagnostics
  DiagnosticError = { fg = "#b1501b" }, -- From legacy DiagnosticError
  DiagnosticWarn = { fg = "#d6b147" }, -- From legacy DiagnosticWarn
  DiagnosticInfo = { fg = "#a1d5a1" }, -- From legacy DiagnosticInfo
  DiagnosticHint = { fg = "#a1a1d5" }, -- From legacy DiagnosticHint
  DiagnosticOk = { fg = "lightgreen" }, -- From legacy DiagnosticOk

  -- Diagnostic virtual text
  DiagnosticVirtualTextError = { link = "DiagnosticError" },
  DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
  DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
  DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
  DiagnosticVirtualTextOk = { link = "DiagnosticOk" },

  -- Diagnostic underlines
  DiagnosticUnderlineError = { sp = "#b1501b", underline = true },
  DiagnosticUnderlineWarn = { sp = "#d6b147" },
  DiagnosticUnderlineInfo = { sp = "#a1d5a1" },
  DiagnosticUnderlineHint = { sp = "#a1a1d5" },
  DiagnosticUnderlineOk = { sp = "lightgreen", underline = true },

  -- Diagnostic floating
  DiagnosticFloatingError = { link = "DiagnosticError" },
  DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
  DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
  DiagnosticFloatingHint = { link = "DiagnosticHint" },
  DiagnosticFloatingOk = { link = "DiagnosticOk" },

  -- Diagnostic signs
  DiagnosticSignError = { link = "DiagnosticError" },
  DiagnosticSignWarn = { link = "DiagnosticWarn" },
  DiagnosticSignInfo = { link = "DiagnosticInfo" },
  DiagnosticSignHint = { link = "DiagnosticHint" },
  DiagnosticSignOk = { link = "DiagnosticOk" },

  -- LSP
  LspReferenceText = { bg = p.highlight_med },
  LspReferenceRead = { bg = p.highlight_med },
  LspReferenceWrite = { bg = p.highlight_med },
  LspCodeLens = { fg = p.muted, italic = true },
  LspCodeLensSeparator = { fg = p.muted },

  -- Treesitter
  ["@variable"] = { fg = p.text },
  ["@variable.builtin"] = { fg = p.text },
  ["@variable.parameter"] = { fg = p.text },
  ["@variable.member"] = { fg = p.text },
  ["@property"] = { fg = p.text },
  ["@field"] = { fg = p.text },

  ["@constant.builtin"] = { fg = p.smooth_navy },
  ["@string.escape"] = { fg = p.accent_blue },
  ["@tag"] = { fg = p.smooth_navy },
  ["@tag.tsx"] = { fg = p.ash },
  ["@constructor"] = { fg = p.chill },
  ["@function.builtin"] = { fg = p.smooth_blue },

  -- Git signs
  GitSignsAdd = { fg = u.lighten(p.diff_added_bg, 30) },
  GitSignsChange = { fg = p.wheat },
  GitSignsDelete = { fg = u.lighten(p.diff_deleted_bg, 30) },

  -- Error and Todo
  Error = { fg = "white", bg = "red" }, -- From legacy Error
  Todo = { fg = "#080e07", bg = "#7c9ffa" }, -- From legacy Todo

  -- Special keys and non-text
  SpecialKey = { fg = p.accent_blue },
  NonText = { fg = p.accent_blue },
  EndOfBuffer = { link = "NonText" },

  -- Directory
  Directory = { fg = p.chill },

  -- Folding
  Folded = { fg = p.muted, bg = p.base },
  FoldColumn = { fg = "#7c9ffa", bg = p.base },

  -- Signs
  SignColumn = { bg = p.base },

  -- Tab line
  TabLine = { underline = true, bg = "darkgrey" },
  TabLineSel = { bold = true },
  TabLineFill = { reverse = true },

  -- Titles and underlines
  Title = { fg = p.wheat, bold = true },
  Underlined = { fg = p.accent_blue, underline = true },

  -- Quick fix
  QuickFixLine = { fg = p.blue },

  -- Telescope
  TelescopePreviewBorder = { fg = p.muted },
  TelescopeResultsBorder = { fg = p.muted },
  TelescopePromptBorder = { fg = p.muted },

  TelescopePreviewTitle = { fg = p.wheat },
  TelescopeResultsTitle = { fg = p.wheat },
  TelescopePromptTitle = { fg = p.wheat },

  TelescopeMatching = { fg = p.wheat, bold = true },
  TelescopeSelectionCaret = { fg = p.accent_blue },
  TelescopePromptCounter = { fg = p.accent_blue },

  TelescopeSelection = { link = "Visual" },
  TelescopePreviewLine = { link = "Visual" },
}
