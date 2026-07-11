local u = require("bob.utilities")

local M = {}

---@param p bob.Palette
---@param config bob.Config
---@return table<string, vim.api.keyset.highlight>
function M.get(p, config)
  local groups = {
    -- ─── Editor UI ──────────────────────────────────────────────────────────

    -- Normal & floats
    Normal = { fg = p.text, bg = p.base },
    NormalNC = { fg = p.text, bg = p.base },
    NormalFloat = { bg = p.highlight_high },
    FloatBorder = { bg = p.overlay },
    FloatTitle = { fg = p.wheat, bg = p.overlay, bold = true }, -- placeholder
    FloatFooter = { fg = p.muted, bg = p.overlay }, -- placeholder

    -- Cursor & current line
    Cursor = { reverse = true },
    TermCursor = { reverse = true },
    CursorLine = { bg = p.highlight_low },
    CursorColumn = { bg = p.highlight_low },
    CursorLineNr = { fg = p.cursor_line_nr, bg = p.highlight_low },
    CursorLineFold = { link = "FoldColumn" },
    CursorLineSign = { link = "SignColumn" },
    ColorColumn = { bg = p.highlight_med },
    MatchParen = { bold = true, underline = true },

    -- Gutter
    LineNr = { fg = p.line_nr },
    LineNrAbove = { link = "LineNr" },
    LineNrBelow = { link = "LineNr" },
    SignColumn = { bg = p.base },
    FoldColumn = { fg = p.accent_purple, bg = p.base },
    Folded = { fg = p.muted, bg = p.base },

    -- Search & substitute
    Search = { bg = p.subtle },
    IncSearch = { bg = p.emerald, fg = u.darken(p.emerald, 80) },
    CurSearch = { link = "IncSearch" },
    Substitute = { link = "IncSearch" },

    -- Visual
    Visual = { bg = p.subtle },
    VisualNOS = { link = "Visual" },

    -- Diff (buffer)
    DiffAdd = { bg = p.diff_added_bg },
    DiffChange = { bg = p.highlight_low },
    DiffDelete = { bg = p.diff_deleted_bg },
    DiffText = { bg = u.lighten(p.diff_added_bg, 2) },
    Added = { fg = u.lighten(p.diff_added_bg, 40) },
    Changed = { fg = p.diff_modified },
    Removed = { fg = u.lighten(p.diff_deleted_bg, 40) },

    -- Messages
    ErrorMsg = { fg = p.text, bg = p.diagnostic_error },
    WarningMsg = { fg = p.red },
    ModeMsg = { fg = p.off_white },
    MoreMsg = { fg = p.emerald },
    Question = { fg = p.emerald, bold = true },
    MsgSeparator = { link = "WinSeparator" },
    healthSuccess = { fg = p.green },
    healthWarning = { fg = p.diagnostic_warn },
    healthError = { fg = p.diagnostic_error },

    -- Popup menu
    Pmenu = { bg = p.overlay },
    PmenuSel = { bg = p.pmenu_sel },
    PmenuSbar = { bg = p.overlay },
    PmenuThumb = { bg = p.pmenu_thumb },
    PmenuKind = { fg = p.wheat, bg = p.overlay }, -- placeholder
    PmenuKindSel = { fg = p.wheat, bg = p.pmenu_sel }, -- placeholder
    PmenuExtra = { fg = p.muted, bg = p.overlay }, -- placeholder
    PmenuExtraSel = { fg = p.muted, bg = p.pmenu_sel }, -- placeholder
    PmenuMatch = { fg = p.wheat, bg = p.overlay, bold = true }, -- placeholder
    PmenuMatchSel = { fg = p.wheat, bg = p.pmenu_sel, bold = true }, -- placeholder
    WildMenu = { link = "PmenuSel" },

    -- Statusline, tabline, winbar
    StatusLine = { bg = p.highlight_med },
    StatusLineNC = { bg = p.highlight_low },
    StatusLineTerm = { link = "StatusLine" },
    StatusLineTermNC = { link = "StatusLineNC" },
    TabLine = { underline = true, bg = p.overlay },
    TabLineSel = { bold = true },
    TabLineFill = { reverse = true },
    WinBar = { fg = p.off_white }, -- placeholder
    WinBarNC = { fg = p.muted }, -- placeholder
    WinSeparator = { fg = p.win_separator_fg, bg = p.win_separator_bg },
    VertSplit = { link = "WinSeparator" },

    -- Spelling
    SpellBad = { sp = p.diagnostic_error, undercurl = true }, -- placeholder
    SpellCap = { sp = p.diagnostic_warn, undercurl = true }, -- placeholder
    SpellLocal = { sp = p.diagnostic_info, undercurl = true }, -- placeholder
    SpellRare = { sp = p.diagnostic_hint, undercurl = true }, -- placeholder

    -- Misc
    Directory = { fg = p.chill },
    NonText = { fg = p.accent_blue },
    EndOfBuffer = { link = "NonText" },
    SpecialKey = { fg = p.accent_blue },
    Whitespace = { fg = p.overlay }, -- placeholder
    Conceal = { fg = p.muted }, -- placeholder
    QuickFixLine = { fg = p.blue },
    Title = { fg = p.wheat, bold = true },
    Underlined = { fg = p.accent_blue, underline = true },
    SnippetTabstop = { bg = p.highlight_med }, -- placeholder

    -- ─── Syntax (classic groups) ────────────────────────────────────────────

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

    Error = { fg = p.text, bg = p.red },
    Todo = { fg = p.win_separator_bg, bg = p.accent_purple },

    -- ─── Diagnostics ────────────────────────────────────────────────────────

    DiagnosticError = { fg = p.diagnostic_error },
    DiagnosticWarn = { fg = p.diagnostic_warn },
    DiagnosticInfo = { fg = p.diagnostic_info },
    DiagnosticHint = { fg = p.diagnostic_hint },
    DiagnosticOk = { fg = p.diagnostic_ok },

    DiagnosticVirtualTextError = { link = "DiagnosticError" },
    DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
    DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
    DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
    DiagnosticVirtualTextOk = { link = "DiagnosticOk" },

    DiagnosticUnderlineError = { sp = p.diagnostic_error, underline = true },
    DiagnosticUnderlineWarn = { sp = p.diagnostic_warn, underline = true },
    DiagnosticUnderlineInfo = { sp = p.diagnostic_info, underline = true },
    DiagnosticUnderlineHint = { sp = p.diagnostic_hint, underline = true },
    DiagnosticUnderlineOk = { sp = p.diagnostic_ok, underline = true },

    DiagnosticFloatingError = { link = "DiagnosticError" },
    DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
    DiagnosticFloatingHint = { link = "DiagnosticHint" },
    DiagnosticFloatingOk = { link = "DiagnosticOk" },

    DiagnosticSignError = { link = "DiagnosticError" },
    DiagnosticSignWarn = { link = "DiagnosticWarn" },
    DiagnosticSignInfo = { link = "DiagnosticInfo" },
    DiagnosticSignHint = { link = "DiagnosticHint" },
    DiagnosticSignOk = { link = "DiagnosticOk" },

    -- ─── LSP ────────────────────────────────────────────────────────────────

    LspReferenceText = { bg = p.highlight_med },
    LspReferenceRead = { bg = p.highlight_med },
    LspReferenceWrite = { bg = p.highlight_med },
    LspCodeLens = { fg = p.muted, italic = true },
    LspCodeLensSeparator = { fg = p.muted },

    -- ─── Treesitter ─────────────────────────────────────────────────────────

    -- Identifiers
    ["@variable"] = { fg = p.text },
    ["@variable.builtin"] = { fg = p.text },
    ["@variable.parameter"] = { fg = p.text },
    ["@variable.parameter.builtin"] = { fg = p.text },
    ["@variable.member"] = { fg = p.text },
    ["@property"] = { fg = p.text },
    ["@field"] = { fg = p.text },
    ["@module"] = { fg = p.text },
    ["@module.builtin"] = { fg = p.text },
    ["@label"] = { link = "Label" },

    -- Literals
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { fg = p.smooth_navy },
    ["@constant.macro"] = { link = "Macro" },
    ["@string"] = { link = "String" },
    ["@string.escape"] = { fg = p.accent_blue },
    ["@string.regexp"] = { fg = p.accent_blue },
    ["@string.special"] = { fg = p.accent_blue },
    ["@string.special.url"] = { fg = p.accent_blue, underline = true },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "SpecialChar" },
    ["@number"] = { link = "Number" },
    ["@number.float"] = { link = "Float" },
    ["@boolean"] = { link = "Boolean" },

    -- Functions
    ["@function"] = { link = "Function" },
    ["@function.call"] = { link = "Function" },
    ["@function.builtin"] = { fg = p.smooth_blue },
    ["@function.method"] = { link = "Function" },
    ["@function.method.call"] = { link = "Function" },
    ["@function.macro"] = { link = "Macro" },
    ["@constructor"] = { fg = p.chill },

    -- Keywords & operators
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.function"] = { link = "Keyword" },
    ["@keyword.return"] = { link = "Keyword" },
    ["@keyword.storage"] = { link = "StorageClass" },
    ["@keyword.debug"] = { link = "Debug" },
    ["@keyword.operator"] = { link = "Operator" },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@keyword.conditional.ternary"] = { link = "Operator" },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.exception"] = { link = "Exception" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@keyword.directive.define"] = { link = "Define" },
    ["@operator"] = { link = "Operator" },

    -- Types
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { link = "Type" },
    ["@type.definition"] = { link = "Typedef" },
    ["@attribute"] = { fg = p.smooth_blue },
    ["@attribute.builtin"] = { fg = p.smooth_blue },

    -- Punctuation
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    ["@punctuation.bracket"] = { link = "Delimiter" },
    ["@punctuation.special"] = { link = "Special" },

    -- Tags (html/jsx)
    ["@tag"] = { fg = p.smooth_navy },
    ["@tag.tsx"] = { fg = p.ash },
    ["@tag.builtin"] = { fg = p.smooth_navy },
    ["@tag.attribute"] = { fg = p.chill },
    ["@tag.delimiter"] = { link = "Delimiter" },

    -- Markup (markdown, help, ...)
    ["@markup.heading"] = { link = "Title" },
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.link"] = { fg = p.accent_blue },
    ["@markup.link.url"] = { fg = p.accent_blue, underline = true },
    ["@markup.link.label"] = { fg = p.accent_blue },
    ["@markup.raw"] = { fg = p.wheat },
    ["@markup.math"] = { link = "Special" },
    ["@markup.list"] = { fg = p.smooth_blue },
    ["@markup.list.checked"] = { fg = p.emerald }, -- placeholder
    ["@markup.list.unchecked"] = { fg = p.muted }, -- placeholder
    ["@markup.quote"] = { fg = p.muted },

    -- Comments
    ["@comment"] = { link = "Comment" },
    ["@comment.todo"] = { link = "Todo" },
    ["@comment.error"] = { fg = p.diagnostic_error, bold = true },
    ["@comment.warning"] = { fg = p.diagnostic_warn, bold = true },
    ["@comment.note"] = { fg = p.diagnostic_info, bold = true },

    -- Diff
    ["@diff.plus"] = { fg = u.lighten(p.diff_added_bg, 40) },
    ["@diff.minus"] = { fg = u.lighten(p.diff_deleted_bg, 40) },
    ["@diff.delta"] = { fg = p.diff_modified },

    -- ─── LSP semantic tokens ────────────────────────────────────────────────

    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.comment"] = {}, -- defer to treesitter inside comments
    ["@lsp.type.decorator"] = { link = "@attribute" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@type" },
    ["@lsp.type.macro"] = { link = "@function.macro" },
    ["@lsp.type.method"] = { link = "@function.method" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.struct"] = { link = "@type" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type" },
    ["@lsp.type.variable"] = { link = "@variable" },
    ["@lsp.typemod.variable.constant"] = { link = "@constant" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },

    -- ─── Plugins ────────────────────────────────────────────────────────────

    -- nvim-cmp
    CmpItemAbbr = { fg = p.text }, -- placeholder
    CmpItemAbbrDeprecated = { fg = p.muted, strikethrough = true }, -- placeholder
    CmpItemAbbrMatch = { fg = p.wheat, bold = true }, -- placeholder
    CmpItemAbbrMatchFuzzy = { fg = p.wheat, bold = true }, -- placeholder
    CmpItemKind = { fg = p.ash }, -- placeholder
    CmpItemKindClass = { link = "Type" },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindStruct = { link = "Type" },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindMethod = { link = "Function" },
    CmpItemKindConstant = { link = "Constant" },
    CmpItemKindKeyword = { link = "Keyword" },
    CmpItemKindVariable = { fg = p.text },
    CmpItemKindSnippet = { fg = p.accent_purple }, -- placeholder

    -- copilot.vim
    CopilotSuggestion = { fg = p.muted, italic = true }, -- placeholder

    -- fugitive / diff filetype
    diffAdded = { bg = p.diff_added_bg },
    diffRemoved = { bg = p.diff_deleted_bg },
    diffChanged = { fg = p.diff_modified }, -- placeholder
    diffFile = { fg = p.wheat, bold = true }, -- placeholder
    diffOldFile = { fg = u.lighten(p.diff_deleted_bg, 40) }, -- placeholder
    diffNewFile = { fg = u.lighten(p.diff_added_bg, 40) }, -- placeholder
    diffLine = { fg = p.accent_blue }, -- placeholder
    diffIndexLine = { fg = p.muted }, -- placeholder

    -- gitsigns
    GitSignsAdd = { fg = u.lighten(p.diff_added_bg, 40) },
    GitSignsChange = { fg = p.wheat },
    GitSignsDelete = { fg = u.lighten(p.diff_deleted_bg, 40) },

    -- telescope
    TelescopeNormal = { link = "Normal" },
    TelescopeBorder = { fg = p.muted },
    TelescopePreviewTitle = { fg = p.wheat },
    TelescopeResultsTitle = { fg = p.wheat },
    TelescopePromptTitle = { fg = p.wheat },
    TelescopeMatching = { fg = p.wheat, bold = true },
    TelescopeSelectionCaret = { fg = p.accent_blue },
    TelescopePromptPrefix = { fg = p.accent_blue },
    TelescopePromptCounter = { fg = p.accent_blue },
    TelescopeSelection = { link = "Visual" },
    TelescopePreviewLine = { link = "Visual" },
    TelescopeMultiSelection = { fg = p.accent_purple },
    TelescopeMultiIcon = { fg = p.accent_purple },
    TelescopeResultsComment = { fg = p.muted },
    TelescopeResultsSpecialComment = { fg = p.muted },
  }

  if config.transparent then
    for _, group in ipairs({ "Normal", "NormalNC", "SignColumn", "FoldColumn", "Folded" }) do
      groups[group].bg = p.none
    end
  end

  return groups
end

return M
