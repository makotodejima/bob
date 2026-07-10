local u = require("bob.utilities")

local M = {}

function M.get(p, config)
  local groups = {
    -- Base groups
    Normal = { fg = p.text, bg = p.base },
    NormalNC = { fg = p.text, bg = p.base },
    NormalFloat = { bg = p.highlight_high },

    -- UI elements
    ColorColumn = { bg = p.highlight_med },

    Cursor = { reverse = true },
    CursorLine = { bg = p.highlight_low },
    CursorColumn = { bg = p.highlight_low },
    CursorLineNr = { fg = p.cursor_line_nr, bg = p.highlight_low },

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
    LineNr = { fg = p.line_nr },
    LineNrAbove = { link = "LineNr" },
    LineNrBelow = { link = "LineNr" },

    -- Statusline
    StatusLine = { bg = p.highlight_med },
    StatusLineNC = { bg = p.highlight_low },

    -- Visual
    Visual = { bg = p.subtle }, -- From legacy Visual
    VisualNOS = { link = "Visual" },

    -- Popups
    Pmenu = { bg = p.overlay },
    PmenuSel = { bg = p.pmenu_sel },
    PmenuSbar = { bg = p.overlay },
    PmenuThumb = { bg = p.pmenu_thumb },

    -- Borders
    FloatBorder = { bg = p.overlay },
    WinSeparator = { fg = p.win_separator_fg, bg = p.win_separator_bg },

    -- Messages
    ErrorMsg = { fg = p.text, bg = p.diagnostic_error },
    WarningMsg = { fg = p.red },
    Question = { fg = p.emerald, bold = true },

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
    DiagnosticError = { fg = p.diagnostic_error },
    DiagnosticWarn = { fg = p.diagnostic_warn },
    DiagnosticInfo = { fg = p.diagnostic_info },
    DiagnosticHint = { fg = p.diagnostic_hint },
    DiagnosticOk = { fg = p.diagnostic_ok },

    -- Diagnostic virtual text
    DiagnosticVirtualTextError = { link = "DiagnosticError" },
    DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
    DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
    DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
    DiagnosticVirtualTextOk = { link = "DiagnosticOk" },

    -- Diagnostic underlines
    DiagnosticUnderlineError = { sp = p.diagnostic_error, underline = true },
    DiagnosticUnderlineWarn = { sp = p.diagnostic_warn, underline = true },
    DiagnosticUnderlineInfo = { sp = p.diagnostic_info, underline = true },
    DiagnosticUnderlineHint = { sp = p.diagnostic_hint, underline = true },
    DiagnosticUnderlineOk = { sp = p.diagnostic_ok, underline = true },

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

    -- Treesitter: identifiers
    ["@variable"] = { fg = p.text },
    ["@variable.builtin"] = { fg = p.text },
    ["@variable.parameter"] = { fg = p.text },
    ["@variable.member"] = { fg = p.text },
    ["@property"] = { fg = p.text },
    ["@field"] = { fg = p.text },
    ["@module"] = { fg = p.text },
    ["@label"] = { link = "Label" },

    -- Treesitter: literals
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { fg = p.smooth_navy },
    ["@constant.macro"] = { link = "Macro" },
    ["@string"] = { link = "String" },
    ["@string.escape"] = { fg = p.accent_blue },
    ["@string.regexp"] = { fg = p.accent_blue },
    ["@string.special"] = { fg = p.accent_blue },
    ["@string.special.url"] = { fg = p.accent_blue, underline = true },
    ["@character"] = { link = "Character" },
    ["@number"] = { link = "Number" },
    ["@number.float"] = { link = "Float" },
    ["@boolean"] = { link = "Boolean" },

    -- Treesitter: functions
    ["@function"] = { link = "Function" },
    ["@function.call"] = { link = "Function" },
    ["@function.builtin"] = { fg = p.smooth_blue },
    ["@function.method"] = { link = "Function" },
    ["@function.method.call"] = { link = "Function" },
    ["@function.macro"] = { link = "Macro" },
    ["@constructor"] = { fg = p.chill },

    -- Treesitter: keywords
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.function"] = { link = "Keyword" },
    ["@keyword.return"] = { link = "Keyword" },
    ["@keyword.operator"] = { link = "Operator" },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.exception"] = { link = "Exception" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@operator"] = { link = "Operator" },

    -- Treesitter: types
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { link = "Type" },
    ["@type.definition"] = { link = "Typedef" },
    ["@attribute"] = { fg = p.smooth_blue },
    ["@attribute.builtin"] = { fg = p.smooth_blue },

    -- Treesitter: punctuation
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    ["@punctuation.bracket"] = { link = "Delimiter" },
    ["@punctuation.special"] = { link = "Special" },

    -- Treesitter: tags (html/jsx)
    ["@tag"] = { fg = p.smooth_navy },
    ["@tag.tsx"] = { fg = p.ash },
    ["@tag.builtin"] = { fg = p.smooth_navy },
    ["@tag.attribute"] = { fg = p.chill },
    ["@tag.delimiter"] = { link = "Delimiter" },

    -- Treesitter: markup (markdown, help, ...)
    ["@markup.heading"] = { link = "Title" },
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.link"] = { fg = p.accent_blue },
    ["@markup.link.url"] = { fg = p.accent_blue, underline = true },
    ["@markup.link.label"] = { fg = p.accent_blue },
    ["@markup.raw"] = { fg = p.wheat },
    ["@markup.list"] = { fg = p.smooth_blue },
    ["@markup.quote"] = { fg = p.muted },

    -- Treesitter: comment keywords
    ["@comment.todo"] = { link = "Todo" },
    ["@comment.error"] = { fg = p.diagnostic_error, bold = true },
    ["@comment.warning"] = { fg = p.diagnostic_warn, bold = true },
    ["@comment.note"] = { fg = p.diagnostic_info, bold = true },

    -- Treesitter: diff
    ["@diff.plus"] = { fg = u.lighten(p.diff_added_bg, 40) },
    ["@diff.minus"] = { fg = u.lighten(p.diff_deleted_bg, 40) },
    ["@diff.delta"] = { fg = p.diff_modified },

    -- LSP semantic tokens
    ["@lsp.type.class"] = { link = "@type" },
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

    -- Git signs
    GitSignsAdd = { fg = u.lighten(p.diff_added_bg, 40) },
    GitSignsChange = { fg = p.wheat },
    GitSignsDelete = { fg = u.lighten(p.diff_deleted_bg, 40) },

    -- Error and Todo
    Error = { fg = p.text, bg = p.red },
    Todo = { fg = p.win_separator_bg, bg = p.accent_purple },

    -- Special keys and non-text
    SpecialKey = { fg = p.accent_blue },
    NonText = { fg = p.accent_blue },
    EndOfBuffer = { link = "NonText" },

    -- Directory
    Directory = { fg = p.chill },

    -- Folding
    Folded = { fg = p.muted, bg = p.base },
    FoldColumn = { fg = p.accent_purple, bg = p.base },

    -- Signs
    SignColumn = { bg = p.base },

    -- Tab line
    TabLine = { underline = true, bg = p.overlay },
    TabLineSel = { bold = true },
    TabLineFill = { reverse = true },

    -- Titles and underlines
    Title = { fg = p.wheat, bold = true },
    Underlined = { fg = p.accent_blue, underline = true },

    -- Quick fix
    QuickFixLine = { fg = p.blue },

    -- Telescope
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

    -- nvim-pasta
    PastaCursor = { reverse = true },
    PastaEntry = { reverse = true },
  }

  if config.transparent then
    for _, group in ipairs({ "Normal", "NormalNC", "SignColumn", "FoldColumn", "Folded" }) do
      groups[group].bg = p.none
    end
  end

  return groups
end

return M
