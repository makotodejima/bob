-- This is the legacy file for bob.nvim
-- Not used in the current version in this directory
-- It used to built with lush.nvim

local lush = require("lush")
local hsl = lush.hsl

local experimentalbg = hsl(175, 22, 2)
local palette = {
  base = {
    -- bg = hsl(120, 28, 3),
    bg = experimentalbg,
    fg = hsl(0, 0, 70),
  },
  blue = hsl(220, 77, 60),
  highlight_low = "#21202e",
  highlight_med = hsl(0, 0, 10),
  highlight_high = hsl(0, 0, 20),
  none = "NONE",
  diff = {
    added = hsl(175, 20, 18),
    deleted = hsl(11, 51, 23),
  },
  p = {
    emerald = hsl(150, 48, 45),
    light_green = hsl(160, 18, 42),
    green = hsl(190, 35, 25),
    dark_green = hsl(185, 20, 24),
    blue = hsl(202, 55, 39),
    smooth_blue = hsl(214, 24, 55),
    smooth_navy = hsl(215, 27, 36),
    teal = hsl(185, 71, 31),
    sky_blue = hsl(186, 93, 32),
    light_blue = hsl(185, 37, 73),
    dark_violet = hsl(232, 21, 45),
    eggplant = hsl(340, 16, 36),
    mahogany = hsl(22, 100, 38),
    auburn = hsl(4, 56, 40),
    red = hsl(9, 76, 35),
    chocolate = hsl(340, 85, 16),
    chill = hsl(30, 16, 55),
    wheat = hsl(30, 58, 74),
    mute = hsl(6, 6, 32),
    ash = hsl(205, 19, 38),
    off_white = hsl(210, 17, 66),
  },
}

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    ColorColumn({ bg = palette.highlight_med }), -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor({ fg = "bg", bg = "fg" }), -- Character under the cursor
    IncSearch({ bg = palette.p.emerald, fg = palette.p.emerald.darken(80) }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch({ IncSearch }), -- Highlighting a search pattern under the cursor (see 'hlsearch')
    Substitute({ IncSearch }), -- |:substitute| replacement text highlighting
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    -- Directory      { }, -- Directory names (and other special names in listings)
    DiffAdd({ bg = palette.diff.added }), -- Diff mode: Added line |diff.txt|
    -- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
    DiffDelete({ bg = palette.diff.deleted }), -- Diff mode: Deleted line |diff.txt|
    -- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    -- ErrorMsg       { }, -- Error messages on the command line
    -- VertSplit      { }, -- Column separating vertically split windows
    -- Folded         { }, -- Line used for closed folds
    -- FoldColumn     { }, -- 'foldcolumn'
    -- SignColumn     { }, -- Column where |signs| are displayed
    -- LineNr         { }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    -- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    -- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|
    -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal({ bg = palette.base.bg, fg = palette.base.fg }), -- Normal text
    -- NormalFloat    { }, -- Normal text in floating windows.
    -- FloatBorder    { }, -- Border of floating windows.
    -- FloatTitle     { }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    -- Pmenu          { }, -- Popup menu: Normal item.
    -- PmenuSel       { }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine({ fg = palette.p.emerald }), -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- Search         { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    -- StatusLine     { }, -- Status line of current window
    -- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    -- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
    -- Visual         { }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg     { }, -- Warning messages
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment({ fg = palette.p.mute, gui = "italic" }), -- Any comment

    Constant({ fg = palette.base.fg }), -- (*) Any constant
    -- String         { }, --   A string constant: "this is a string"
    -- Character      { }, --   A character constant: 'c', '\n'
    Number({ fg = palette.base.fg }), --   A number constant: 234, 0xff
    Boolean({ fg = palette.base.fg, gui = "bold" }), --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    -- Identifier     { }, -- (*) Any variable name
    -- Function       { }, --   Function name (also: methods for classes)

    -- Statement      { }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Operator       { }, --   "sizeof", "+", "*", etc.
    Keyword({ fg = "#3a6265" }), --   any other keyword
    -- Exception      { }, --   try, catch, throw

    -- PreProc        { }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    -- Type { fg = palette.p.wheat }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    -- Special        { }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error          { }, -- Any erroneous construct
    -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
    --
    --
    --
    --
    --
    --
    --

    SpecialKey({ fg = "#7c9ffa" }), -- SpecialKey     xxx guifg=#7c9ffa
    netrwSuffixes({ SpecialKey }), -- netrwSuffixes  xxx links to SpecialKey
    TermCursor({ gui = "reverse" }), -- TermCursor     xxx cterm=reverse gui=reverse
    NonText({ fg = "#7c9ffa" }), -- NonText        xxx guifg=#7c9ffa
    EndOfBuffer({ NonText }), -- EndOfBuffer    xxx links to NonText
    LspInlayHint({ NonText }), -- LspInlayHint   xxx links to NonText
    TelescopeResultsDiffUntracked({ NonText }), -- TelescopeResultsDiffUntracked xxx links to NonText
    TelescopePreviewHyphen({ NonText }), -- TelescopePreviewHyphen xxx links to NonText
    GitSignsCurrentLineBlame({ NonText }), -- GitSignsCurrentLineBlame xxx links to NonText
    Directory({ fg = palette.p.chill }), -- Directory      xxx cterm=bold gui=bold guifg=#928374
    TelescopePreviewDirectory({ Directory }), -- TelescopePreviewDirectory xxx links to Directory
    TelescopePreviewDate({ Directory }), -- TelescopePreviewDate xxx links to Directory
    OilDir({ Directory }), -- OilDir         xxx links to Directory
    netrwDir({ Directory }), -- netrwDir       xxx links to Directory
    ErrorMsg({ fg = palette.p.off_white, bg = palette.p.red }), -- ErrorMsg       xxx ctermfg=15 ctermbg=1 guifg=White guibg=Red
    NvimInvalidSpacing({ ErrorMsg }), -- NvimInvalidSpacing xxx links to ErrorMsg
    -- IncSearch { fg = "#141414", bg = "#7c9ffa" }, -- IncSearch      xxx guifg=#141414 guibg=#7c9ffa
    -- CurSearch { IncSearch }, -- CurSearch      xxx links to IncSearch
    -- Substitute { IncSearch }, -- Substitute     xxx links to IncSearch
    MoreMsg({ fg = "#82e887" }), -- MoreMsg        xxx guifg=#82e887
    ModeMsg({ gui = "bold" }), -- ModeMsg        xxx cterm=bold gui=bold
    LineNr({ fg = "#363c49" }), -- LineNr         xxx guifg=#2c323c guibg=#080e07
    LineNrAbove({ LineNr }), -- LineNrAbove    xxx links to LineNr
    LineNrBelow({ LineNr }), -- LineNrBelow    xxx links to LineNr
    TelescopeResultsLineNr({ LineNr }), -- TelescopeResultsLineNr xxx links to LineNr
    TreesitterContextLineNumber({ LineNr }), -- TreesitterContextLineNumber xxx links to LineNr
    CursorLineNr({ fg = "#57647f", bg = "#141414" }), -- CursorLineNr   xxx cterm=bold gui=bold guifg=#4d5766 guibg=#141414
    MarkSignNumHL({ CursorLineNr }), -- MarkSignNumHL  xxx links to CursorLineNr
    CursorLineSign({ bg = "#141414" }), -- CursorLineSign xxx guibg=#141414
    CursorLineFold({ fg = "#7c9ffa", bg = "#141414" }), -- CursorLineFold xxx guifg=#7c9ffa guibg=#141414
    Question({ fg = "green", gui = "bold" }), -- Question       xxx ctermfg=121 gui=bold guifg=Green
    netrwSymLink({ Question }), -- netrwSymLink   xxx links to Question
    StatusLine({ bg = palette.highlight_med }), -- StatusLine     xxx guibg=#141414
    MsgSeparator({ StatusLine }), -- MsgSeparator   xxx links to StatusLine
    StatusLineNC({ gui = "reverse" }), -- StatusLineNC   xxx cterm=reverse gui=reverse
    WinSeparator({ fg = "#2c323c", bg = "#080e07" }), -- WinSeparator   xxx guifg=#2c323c guibg=#080e07
    VertSplit({ fg = "#2c323c", bg = "#080e07" }), -- VertSplit      xxx guifg=#2c323c guibg=#080e07
    Title({ fg = "#d5bba1", gui = "bold" }), -- Title          xxx cterm=bold gui=bold guifg=#d5bba1
    sym("@text.title")({ Title }), -- @text.title    xxx links to Title
    LspInfoTitle({ Title }), -- LspInfoTitle   xxx links to Title
    Visual({ bg = "#273953" }), -- Visual         xxx guibg=#273953
    Search({ Visual }), -- Search         xxx links to Visual
    PmenuSel({ Visual }), -- PmenuSel       xxx links to Visual
    SnippetTabstop({ Visual }), -- SnippetTabstop xxx links to Visual
    TelescopePreviewLine({ Visual }), -- TelescopePreviewLine xxx links to Visual
    TelescopeSelection({ Visual }), -- TelescopeSelection xxx links to Visual
    TSPlaygroundFocus({ Visual }), -- TSPlaygroundFocus xxx links to Visual
    WarningMsg({ fg = "red" }), -- WarningMsg     xxx ctermfg=224 guifg=Red
    netrwCoreDump({ WarningMsg }), -- netrwCoreDump  xxx links to WarningMsg
    WildMenu({ fg = "black", bg = "yellow" }), -- WildMenu       xxx ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
    Folded({ fg = "#2c323c", bg = "#080e07" }), -- Folded         xxx guifg=#2c323c guibg=#080e07
    netrwData({ Folded }), -- netrwData      xxx links to Folded
    netrwGray({ Folded }), -- netrwGray      xxx links to Folded
    FoldColumn({ fg = "#7c9ffa", bg = "#080e07" }), -- FoldColumn     xxx guifg=#7c9ffa guibg=#080e07
    -- DiffAdd { fg = "#cccccc", bg = "#204437" }, -- DiffAdd        xxx guifg=#cccccc guibg=#204437
    -- GitSignsAddInline { DiffAdd }, -- GitSignsAddInline xxx links to DiffAdd
    -- TelescopeResultsDiffAdd { DiffAdd }, -- TelescopeResultsDiffAdd xxx links to DiffAdd
    -- GitSignsAddLn { DiffAdd }, -- GitSignsAddLn  xxx links to DiffAdd
    -- GitSignsAddPreview { DiffAdd }, -- GitSignsAddPreview xxx links to DiffAdd
    DiffChange({ bg = "#1f2325" }), -- DiffChange     xxx guibg=#1f2325
    GitSignsChangeInline({ DiffChange }), -- GitSignsChangeInline xxx links to DiffChange
    TelescopeResultsDiffChange({ DiffChange }), -- TelescopeResultsDiffChange xxx links to DiffChange
    netrwLib({ DiffChange }), -- netrwLib       xxx links to DiffChange
    netrwMakefile({ DiffChange }), -- netrwMakefile  xxx links to DiffChange
    GitSignsChangeLn({ DiffChange }), -- GitSignsChangeLn xxx links to DiffChange
    -- DiffDelete { bg = "#59281d" }, -- DiffDelete     xxx guibg=#59281d
    -- GitSignsDeleteInline { DiffDelete }, -- GitSignsDeleteInline xxx links to DiffDelete
    -- TelescopeResultsDiffDelete { DiffDelete }, -- TelescopeResultsDiffDelete xxx links to DiffDelete
    -- GitSignsDeletePreview { DiffDelete }, -- GitSignsDeletePreview xxx links to DiffDelete
    -- GitSignsDeleteVirtLn { DiffDelete }, -- GitSignsDeleteVirtLn xxx links to DiffDelete
    DiffText({ fg = "#cccccc", bg = "#204437" }), -- DiffText       xxx guifg=#cccccc guibg=#204437
    SignColumn({ bg = "#080e07" }), -- SignColumn     xxx guibg=#080e07
    Conceal({ fg = "lightgrey", bg = "darkgrey" }), -- Conceal        xxx ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
    SpellBad({ sp = "red", gui = "undercurl" }), -- SpellBad       xxx ctermbg=9 gui=undercurl guisp=Red
    SpellCap({ sp = "blue", gui = "undercurl" }), -- SpellCap       xxx ctermbg=12 gui=undercurl guisp=Blue
    SpellRare({ sp = "magenta", gui = "undercurl" }), -- SpellRare      xxx ctermbg=13 gui=undercurl guisp=Magenta
    SpellLocal({ sp = "cyan", gui = "undercurl" }), -- SpellLocal     xxx ctermbg=14 gui=undercurl guisp=Cyan
    Pmenu({ bg = "#323232" }), -- Pmenu          xxx guibg=#323232
    PmenuKind({ Pmenu }), -- PmenuKind      xxx links to Pmenu
    PmenuExtra({ Pmenu }), -- PmenuExtra     xxx links to Pmenu
    PmenuSbar({ bg = "#323232" }), -- PmenuSbar      xxx guibg=#323232
    PmenuThumb({ bg = "#464646" }), -- PmenuThumb     xxx guibg=#464646
    TabLine({ gui = "underline", bg = "darkgrey" }), -- TabLine        xxx cterm=underline ctermfg=15 ctermbg=242 gui=underline guibg=DarkGrey
    TabLineSel({ gui = "bold" }), -- TabLineSel     xxx cterm=bold gui=bold
    netrwMarkFile({ TabLineSel }), -- netrwMarkFile  xxx links to TabLineSel
    TabLineFill({ gui = "reverse" }), -- TabLineFill    xxx cterm=reverse gui=reverse
    CursorColumn({ bg = "grey40" }), -- CursorColumn   xxx ctermbg=242 guibg=Grey40
    CursorLine({ bg = "#1b1b1b" }), -- CursorLine     xxx guibg=#141414
    -- ColorColumn { bg = "#282828" }, -- ColorColumn    xxx guibg=#282828
    Whitespace({ fg = "#7c9ffa" }), -- Whitespace     xxx guifg=#7c9ffa
    NormalNC({ fg = palette.base.fg.darken(10), bg = palette.base.bg.darken(50) }),
    NormalFloat({ bg = palette.highlight_high }), -- NormalFloat    xxx guibg=#2a2f37
    NotifyBackground({ NormalFloat }), -- NotifyBackground xxx links to NormalFloat
    NotifyTRACEBody({ NormalFloat }), -- NotifyTRACEBody xxx links to NormalFloat
    NotifyDEBUGBody({ NormalFloat }), -- NotifyDEBUGBody xxx links to NormalFloat
    NotifyINFOBody({ NormalFloat }), -- NotifyINFOBody xxx links to NormalFloat
    NotifyWARNBody({ NormalFloat }), -- NotifyWARNBody xxx links to NormalFloat
    NotifyERRORBody({ NormalFloat }), -- NotifyERRORBody xxx links to NormalFloat
    FloatBorder({ bg = "#323232" }), -- FloatBorder    xxx guibg=#323232
    TreesitterContextSeparator({ FloatBorder }), -- TreesitterContextSeparator xxx links to FloatBorder
    WinBar({ bg = "#080e07" }), -- WinBar         xxx guibg=#080e07
    WinBarNC({ bg = "#080e07" }), -- WinBarNC       xxx guibg=#080e07
    -- Cursor { fg = "bg", bg = "fg" }, -- Cursor         xxx guifg=bg guibg=fg
    FloatTitle({ fg = "#080e07", gui = "bold", bg = "#ebcfb2" }), -- FloatTitle     xxx cterm=bold gui=bold guifg=#080e07 guibg=#ebcfb2
    FloatFooter({ fg = "#080e07", gui = "bold", bg = "#ebcfb2" }), -- FloatFooter    xxx cterm=bold gui=bold guifg=#080e07 guibg=#ebcfb2
    lCursor({ fg = "bg", bg = "fg" }), -- lCursor        xxx guifg=bg guibg=fg
    -- Normal { fg = "#cccccc", bg = "#080e07" }, -- Normal         xxx guifg=#cccccc guibg=#080e07
    NvimSpacing({ Normal }), -- NvimSpacing    xxx links to Normal
    TelescopeNormal({ Normal }), -- TelescopeNormal xxx links to Normal
    FloatShadow({ blend = 80, bg = "black" }), -- FloatShadow    xxx guibg=Black blend=80
    FloatShadowThrough({ blend = 100, bg = "black" }), -- FloatShadowThrough xxx guibg=Black blend=100
    RedrawDebugNormal({ gui = "reverse" }), -- RedrawDebugNormal xxx cterm=reverse gui=reverse
    RedrawDebugClear({ bg = "yellow" }), -- RedrawDebugClear xxx ctermbg=11 guibg=Yellow
    RedrawDebugComposed({ bg = "green" }), -- RedrawDebugComposed xxx ctermbg=10 guibg=Green
    RedrawDebugRecompose({ bg = "red" }), -- RedrawDebugRecompose xxx ctermbg=9 guibg=Red
    Error({ fg = "white", bg = "red" }), -- Error          xxx ctermfg=15 ctermbg=9 guifg=White guibg=Red
    NvimInvalid({ Error }), -- NvimInvalid    xxx links to Error
    TSQueryLinterError({ Error }), -- TSQueryLinterError xxx links to Error
    Todo({ fg = "#080e07", bg = "#7c9ffa" }), -- Todo           xxx guifg=#080e07 guibg=#7c9ffa
    sym("@comment.todo")({ Todo }), -- @text.todo     xxx links to Todo
    String({ fg = "#a89684" }), -- String         xxx guifg=#a89684
    sym("@string")({ String }), -- @string        xxx links to String
    NvimString({ String }), -- NvimString     xxx links to String
    -- TelescopePreviewSize { String }, -- TelescopePreviewSize xxx links to String
    -- TelescopePreviewExecute { String }, -- TelescopePreviewExecute xxx links to String
    TSPlaygroundLang({ String }), -- TSPlaygroundLang xxx links to String
    -- Constant { fg = "#ffffff", gui = "bold" }, -- Constant       xxx cterm=bold gui=bold guifg=#ffffff
    Character({ Constant }), -- Character      xxx links to Constant
    sym("@constant")({ Constant }), -- @constant      xxx links to Constant
    sym("@lsp.type.enumMember")({ Constant }), -- @lsp.type.enumMember xxx links to Constant
    -- TelescopePreviewRead { Constant }, -- TelescopePreviewRead xxx links to Constant
    -- TelescopePreviewBlock { Constant }, -- TelescopePreviewBlock xxx links to Constant
    -- TelescopePreviewCharDev { Constant }, -- TelescopePreviewCharDev xxx links to Constant
    -- TelescopePreviewPipe { Constant }, -- TelescopePreviewPipe xxx links to Constant
    -- TelescopeResultsConstant { Constant }, -- TelescopeResultsConstant xxx links to Constant
    -- TelescopePreviewGroup { Constant }, -- TelescopePreviewGroup xxx links to Constant
    -- TelescopePreviewUser { Constant }, -- TelescopePreviewUser xxx links to Constant
    -- Number { fg = "#ffffff" }, -- Number         xxx guifg=#ffffff
    Float({ Number }), -- Float          xxx links to Number
    sym("@number")({ Number }), -- @number        xxx links to Number
    NvimNumber({ Number }), -- NvimNumber     xxx links to Number
    TelescopeResultsNumber({ Number }), -- TelescopeResultsNumber xxx links to Number
    netrwQHTopic({ Number }), -- netrwQHTopic   xxx links to Number
    -- Boolean { fg = "#ffffff", gui = "bold" }, -- Boolean        xxx cterm=bold gui=bold guifg=#ffffff
    sym("@boolean")({ Boolean }), -- @boolean       xxx links to Boolean
    Function({ fg = palette.p.off_white }), -- Function       xxx guifg=#d5bba1
    sym("@function")({ Function }), -- @function      xxx links to Function
    sym("@method")({ Function }), -- @method        xxx links to Function
    sym("@lsp.type.decorator")({ Function }), -- @lsp.type.decorator xxx links to Function
    sym("@lsp.type.function")({ Function }), -- @lsp.type.function xxx links to Function
    sym("@lsp.type.method")({ Function }), -- @lsp.type.method xxx links to Function
    -- TelescopeResultsFunction { Function }, -- TelescopeResultsFunction xxx links to Function
    -- TelescopeResultsField { Function }, -- TelescopeResultsField xxx links to Function
    -- TelescopeResultsClass { Function }, -- TelescopeResultsClass xxx links to Function
    LspInfoList({ Function }), -- LspInfoList    xxx links to Function
    netrwClassify({ Function }), -- netrwClassify  xxx links to Function
    netrwHelpCmd({ Function }), -- netrwHelpCmd   xxx links to Function
    Identifier({ fg = palette.base.fg }), -- Identifier     xxx guifg=#cccccc
    sym("@parameter")({ Identifier }), -- @parameter     xxx links to Identifier
    sym("@field")({ Identifier }), -- @field         xxx links to Identifier
    sym("@property")({ Identifier }), -- @property      xxx links to Identifier
    sym("@variable")({ Identifier }), -- @variable      xxx links to Identifier
    sym("@namespace")({ Identifier }), -- @namespace     xxx links to Identifier
    sym("@lsp.type.parameter")({ Identifier }), -- @lsp.type.parameter xxx links to Identifier
    sym("@lsp.type.property")({ Identifier }), -- @lsp.type.property xxx links to Identifier
    sym("@lsp.type.variable")({ Identifier }), -- @lsp.type.variable xxx links to Identifier
    NvimIdentifier({ Identifier }), -- NvimIdentifier xxx links to Identifier
    TelescopePromptPrefix({ Identifier }), -- TelescopePromptPrefix xxx links to Identifier
    TelescopeMultiIcon({ Identifier }), -- TelescopeMultiIcon xxx links to Identifier
    TelescopeResultsIdentifier({ Identifier }), -- TelescopeResultsIdentifier xxx links to Identifier
    MarkSignHL({ Identifier }), -- MarkSignHL     xxx links to Identifier
    netrwVersion({ Identifier }), -- netrwVersion   xxx links to Identifier
    Conditional({ fg = "#7189a8" }), -- Conditional    xxx guifg=#7189a8
    sym("@conditional")({ Conditional }), -- @conditional   xxx links to Conditional
    Statement({ fg = "#7189a8" }), -- Statement      xxx guifg=#7189a8
    Repeat({ Statement }), -- Repeat         xxx links to Statement
    Label({ Statement }), -- Label          xxx links to Statement
    TelescopePreviewSocket({ Statement }), -- TelescopePreviewSocket xxx links to Statement
    TelescopePreviewWrite({ Statement }), -- TelescopePreviewWrite xxx links to Statement
    netrwHidePat({ Statement }), -- netrwHidePat   xxx links to Statement
    netrwList({ Statement }), -- netrwList      xxx links to Statement
    Operator({ fg = "#7189a8" }), -- Operator       xxx guifg=#7189a8
    sym("@operator")({ Operator }), -- @operator      xxx links to Operator
    NvimAssignment({ Operator }), -- NvimAssignment xxx links to Operator
    NvimOperator({ Operator }), -- NvimOperator   xxx links to Operator
    TelescopeResultsOperator({ Operator }), -- TelescopeResultsOperator xxx links to Operator
    -- Keyword { fg = "#a89684" }, -- Keyword        xxx guifg=#a89684
    Exception({ Keyword }), -- Exception      xxx links to Keyword
    sym("@keyword")({ Keyword }), -- @keyword       xxx links to Keyword
    sym("@text.literal.block.markdown")({ Keyword }), -- @text.literal.block.markdown xxx links to Keyword
    sym("@text.literal.markdown_inline")({ Keyword }), -- @text.literal.markdown_inline xxx links to Keyword
    TelescopePreviewSticky({ Keyword }), -- TelescopePreviewSticky xxx links to Keyword
    OilSocket({ Keyword }), -- OilSocket      xxx links to Keyword
    Include({ fg = "#7189a8" }), -- Include        xxx guifg=#7189a8
    sym("@include")({ Include }), -- @include       xxx links to Include
    PreProc({ fg = "#7189a8", gui = "bold" }), -- PreProc        xxx cterm=bold gui=bold guifg=#7189a8
    sym("@preproc")({ PreProc }), -- @preproc       xxx links to PreProc
    netrwExe({ PreProc }), -- netrwExe       xxx links to PreProc
    Define({ fg = "#7189a8", gui = "bold" }), -- Define         xxx cterm=bold gui=bold guifg=#7189a8
    sym("@constant.macro")({ Define }), -- @constant.macro xxx links to Define
    sym("@define")({ Define }), -- @define        xxx links to Define
    Macro({ fg = "#7189a8", gui = "bold" }), -- Macro          xxx cterm=bold gui=bold guifg=#7189a8
    sym("@macro")({ Macro }), -- @macro         xxx links to Macro
    sym("@function.macro")({ Macro }), -- @function.macro xxx links to Macro
    sym("@lsp.type.macro")({ Macro }), -- @lsp.type.macro xxx links to Macro
    PreCondit({ fg = "#7189a8", gui = "bold" }), -- PreCondit      xxx cterm=bold gui=bold guifg=#7189a8
    Type({ fg = palette.p.wheat }), -- Type           xxx cterm=bold gui=bold guifg=#ebcfb2
    StorageClass({ Type }), -- StorageClass   xxx links to Type
    Structure({ Type }), -- Structure      xxx links to Type
    Typedef({ Type }), -- Typedef        xxx links to Type
    sym("@type")({ Type }), -- @type          xxx links to Type
    sym("@lsp.type.type")({ Type }), -- @lsp.type.type xxx links to Type
    NvimNumberPrefix({ Type }), -- NvimNumberPrefix xxx links to Type
    NvimOptionSigil({ Type }), -- NvimOptionSigil xxx links to Type
    TelescopeMultiSelection({ Type }), -- TelescopeMultiSelection xxx links to Type
    LspInfoFiletype({ Type }), -- LspInfoFiletype xxx links to Type
    Special({ fg = "#616769" }), -- Special        xxx guifg=#696969
    Tag({ Special }), -- Tag            xxx links to Special
    Delimiter({ Special }), -- Delimiter      xxx links to Special
    SpecialComment({ Special }), -- SpecialComment xxx links to Special
    Debug({ Special }), -- Debug          xxx links to Special
    sym("@constant.builtin")({ fg = palette.p.smooth_navy }), -- @constant.builtin xxx links to Special
    TelescopePreviewLink({ Special }), -- TelescopePreviewLink xxx links to Special
    OilChange({ Special }), -- OilChange      xxx links to Special
    netrwLink({ Special }), -- netrwLink      xxx links to Special
    netrwTreeBar({ Special }), -- netrwTreeBar   xxx links to Special
    netrwPix({ Special }), -- netrwPix       xxx links to Special
    DiagnosticError({ fg = "#b1501b" }), -- DiagnosticError xxx guifg=#b1501b
    DiagnosticVirtualTextError({ DiagnosticError }), -- DiagnosticVirtualTextError xxx links to DiagnosticError
    DiagnosticFloatingError({ DiagnosticError }), -- DiagnosticFloatingError xxx links to DiagnosticError
    DiagnosticSignError({ DiagnosticError }), -- DiagnosticSignError xxx links to DiagnosticError
    OilDelete({ DiagnosticError }), -- OilDelete      xxx links to DiagnosticError
    DiagnosticWarn({ fg = "#d6b147" }), -- DiagnosticWarn xxx guifg=#d6b147
    DiagnosticVirtualTextWarn({ DiagnosticWarn }), -- DiagnosticVirtualTextWarn xxx links to DiagnosticWarn
    DiagnosticFloatingWarn({ DiagnosticWarn }), -- DiagnosticFloatingWarn xxx links to DiagnosticWarn
    DiagnosticSignWarn({ DiagnosticWarn }), -- DiagnosticSignWarn xxx links to DiagnosticWarn
    OilMove({ DiagnosticWarn }), -- OilMove        xxx links to DiagnosticWarn
    DiagnosticInfo({ fg = "#a1d5a1" }), -- DiagnosticInfo xxx guifg=#a1d5a1
    DiagnosticVirtualTextInfo({ DiagnosticInfo }), -- DiagnosticVirtualTextInfo xxx links to DiagnosticInfo
    DiagnosticFloatingInfo({ DiagnosticInfo }), -- DiagnosticFloatingInfo xxx links to DiagnosticInfo
    DiagnosticSignInfo({ DiagnosticInfo }), -- DiagnosticSignInfo xxx links to DiagnosticInfo
    OilCreate({ DiagnosticInfo }), -- OilCreate      xxx links to DiagnosticInfo
    DiagnosticHint({ fg = palette.p.dark_violet }), -- DiagnosticHint xxx guifg=#a1a1d5
    DiagnosticVirtualTextHint({ DiagnosticHint }), -- DiagnosticVirtualTextHint xxx links to DiagnosticHint
    DiagnosticFloatingHint({ DiagnosticHint }), -- DiagnosticFloatingHint xxx links to DiagnosticHint
    DiagnosticSignHint({ DiagnosticHint }), -- DiagnosticSignHint xxx links to DiagnosticHint
    OilCopy({ DiagnosticHint }), -- OilCopy        xxx links to DiagnosticHint
    DiagnosticOk({ fg = "lightgreen" }), -- DiagnosticOk   xxx ctermfg=10 guifg=LightGreen
    DiagnosticVirtualTextOk({ DiagnosticOk }), -- DiagnosticVirtualTextOk xxx links to DiagnosticOk
    DiagnosticFloatingOk({ DiagnosticOk }), -- DiagnosticFloatingOk xxx links to DiagnosticOk
    DiagnosticSignOk({ DiagnosticOk }), -- DiagnosticSignOk xxx links to DiagnosticOk
    DiagnosticUnderlineError({ sp = "#b1501b", gui = "underline" }), -- DiagnosticUnderlineError xxx guisp=#b1501b
    DiagnosticUnderlineWarn({ sp = "#d6b147" }), -- DiagnosticUnderlineWarn xxx guisp=#d6b147
    DiagnosticUnderlineInfo({ sp = "#a1d5a1" }), -- DiagnosticUnderlineInfo xxx guisp=#a1d5a1
    DiagnosticUnderlineHint({ sp = "#a1a1d5" }), -- DiagnosticUnderlineHint xxx guisp=#a1a1d5
    DiagnosticUnderlineOk({ sp = "lightgreen", gui = "underline" }), -- DiagnosticUnderlineOk xxx cterm=underline gui=underline guisp=LightGreen
    DiagnosticDeprecated({ fg = "#665d5c", gui = "italic,strikethrough" }), -- DiagnosticDeprecated xxx cterm=italic,strikethrough gui=italic,strikethrough guifg=#665d5c
    DiagnosticUnnecessary({ fg = "#665d5c", gui = "italic" }), -- DiagnosticUnnecessary xxx cterm=italic gui=italic guifg=#665d5c
    -- Comment { fg = "#665d5c", gui = "italic" }, -- Comment        xxx cterm=italic gui=italic guifg=#665d5c
    sym("@text.literal")({ Comment }), -- @text.literal  xxx links to Comment
    sym("@comment")({ Comment }), -- @comment       xxx links to Comment
    sym("@lsp.type.comment")({ Comment }), -- @lsp.type.comment xxx links to Comment
    sym("@variable.luadoc")({ Comment }), -- @variable.luadoc xxx links to Comment
    LazyComment({ Comment }), -- LazyComment    xxx links to Comment
    TelescopeResultsComment({ Comment }), -- TelescopeResultsComment xxx links to Comment
    MarkVirtTextHL({ Comment }), -- MarkVirtTextHL xxx links to Comment
    OilLinkTarget({ Comment }), -- OilLinkTarget  xxx links to Comment
    OilTrashSourcePath({ Comment }), -- OilTrashSourcePath xxx links to Comment
    LspInfoTip({ Comment }), -- LspInfoTip     xxx links to Comment
    netrwComment({ Comment }), -- netrwComment   xxx links to Comment
    sym("@text.reference")({ fg = "#cccccc", gui = "bold" }), -- @text.reference xxx cterm=bold gui=bold guifg=#cccccc
    Underlined({ fg = "#80a0ff", gui = "underline" }), -- Underlined     xxx cterm=underline ctermfg=81 gui=underline guifg=#80a0ff
    SpecialChar({ Underlined }), -- SpecialChar    xxx links to Special
    sym("@string.escape")({ fg = "#80a0ff" }), -- SpecialChar
    sym("@text.uri")({ Underlined }), -- @text.uri      xxx links to Underlined
    sym("@markup.link.url")({ Underlined }),
    sym("@text.underline")({ Underlined }), -- @text.underline xxx links to Underlined
    sym("@function.builtin")({ fg = "#7189a8" }), -- @function.builtin xxx guifg=#7189a8
    sym("@tag.tsx")({ fg = palette.p.ash }), -- @function.builtin xxx guifg=#7189a8
    sym("@constructor")({ fg = "#928374" }), -- @constructor   xxx guifg=#928374
    sym("@tag")({ fg = "#7189a8" }), -- @tag           xxx guifg=#7189a8
    MatchParen({ gui = "bold,underline" }), -- MatchParen     xxx cterm=bold,underline gui=bold,underline
    Ignore({ fg = "bg" }), -- Ignore         xxx ctermfg=0 guifg=bg
    NvimInternalError({ bg = "red" }), -- NvimInternalError xxx ctermfg=9 ctermbg=9 guifg=Red guibg=Red
    NvimFigureBrace({ NvimInternalError }), -- NvimFigureBrace xxx links to NvimInternalError
    NvimSingleQuotedUnknownEscape({ NvimInternalError }), -- NvimSingleQuotedUnknownEscape xxx links to NvimInternalError
    NvimInvalidSingleQuotedUnknownEscape({ NvimInternalError }), -- NvimInvalidSingleQuotedUnknownEscape xxx links to NvimInternalError
    NotifyINFOBorder({ fg = "#323232", bg = "#323232" }), -- NotifyINFOBorder xxx guifg=#323232 guibg=#323232
    NotifyWARNBorder({ fg = "#323232", bg = "#323232" }), -- NotifyWARNBorder xxx guifg=#323232 guibg=#323232
    NotifyERRORBorder({ fg = "#323232", bg = "#323232" }), -- NotifyERRORBorder xxx guifg=#323232 guibg=#323232
    sym("@text.todo.checked")({ fg = "#a1d5a1", gui = "strikethrough" }), -- @text.todo.checked xxx cterm=strikethrough gui=strikethrough guifg=#a1d5a1
    sym("@text.todo.unchecked")({ fg = "#b1501b" }), -- @text.todo.unchecked xxx guifg=#b1501b
    IlluminatedWordWrite({ bg = "#323232" }), -- IlluminatedWordWrite xxx guibg=#323232
    IlluminatedWordRead({ bg = "#323232" }), -- IlluminatedWordRead xxx guibg=#323232
    IlluminatedWordText({ bg = "#323232" }), -- IlluminatedWordText xxx guibg=#323232
    GitSignsDelete({ fg = "#b1501b" }), -- GitSignsDelete xxx guifg=#b1501b
    GitSignsTopdelete({ GitSignsDelete }), -- GitSignsTopdelete xxx links to GitSignsDelete
    GitSignsDeleteNr({ GitSignsDelete }), -- GitSignsDeleteNr xxx links to GitSignsDelete
    GitSignsChange({ fg = "#d6b147" }), -- GitSignsChange xxx guifg=#d6b147
    GitSignsChangedelete({ GitSignsChange }), -- GitSignsChangedelete xxx links to GitSignsChange
    GitSignsChangeNr({ GitSignsChange }), -- GitSignsChangeNr xxx links to GitSignsChange
    GitSignsAdd({ fg = "#a1d5a1" }), -- GitSignsAdd    xxx guifg=#a1d5a1
    GitSignsUntracked({ GitSignsAdd }), -- GitSignsUntracked xxx links to GitSignsAdd
    GitSignsAddNr({ GitSignsAdd }), -- GitSignsAddNr  xxx links to GitSignsAdd
    LazyButtonActive({ fg = "#080e07", gui = "bold", bg = "#7c9ffa" }), -- LazyButtonActive xxx cterm=bold gui=bold guifg=#080e07 guibg=#7c9ffa
    IndentBlanklineContextStart({ sp = "#4d5766", gui = "underline" }), -- IndentBlanklineContextStart xxx cterm=underline gui=underline guisp=#4d5766
    IndentBlanklineContextChar({ fg = "#4d5766" }), -- IndentBlanklineContextChar xxx guifg=#4d5766
    IndentBlanklineChar({ fg = "#282828" }), -- IndentBlanklineChar xxx guifg=#282828
    TelescopePreviewTitle({ fg = "#080e07", bg = "#ebcfb2" }), -- TelescopePreviewTitle xxx guifg=#080e07 guibg=#ebcfb2
    TelescopePreviewNormal({ bg = "#141414" }), -- TelescopePreviewNormal xxx guibg=#141414
    TelescopePreviewMessage({ TelescopePreviewNormal }), -- TelescopePreviewMessage xxx links to TelescopePreviewNormal
    TelescopePreviewBorder({ fg = "#665d5c", bg = "#141414" }), -- TelescopePreviewBorder xxx guifg=#665d5c guibg=#141414
    TelescopeMatching({ fg = "#ebcfb2", gui = "bold" }), -- TelescopeMatching xxx cterm=bold gui=bold guifg=#ebcfb2
    TelescopeSelectionCaret({ fg = "#b1501b" }), -- TelescopeSelectionCaret xxx guifg=#b1501b
    TelescopeResultsNormal({ bg = "#141414" }), -- TelescopeResultsNormal xxx guibg=#141414
    TelescopeResultsBorder({ fg = "#665d5c", bg = "#141414" }), -- TelescopeResultsBorder xxx guifg=#665d5c guibg=#141414
    TelescopeResultsTitle({ fg = "#080e07", bg = "#ebcfb2" }), -- TelescopeResultsTitle xxx guifg=#080e07 guibg=#ebcfb2
    TelescopePromptCounter({ fg = "#7c9ffa", gui = "bold" }), -- TelescopePromptCounter xxx cterm=bold gui=bold guifg=#7c9ffa
    TelescopePromptNormal({ bg = "#141414" }), -- TelescopePromptNormal xxx guibg=#141414
    TelescopePromptBorder({ fg = "#665d5c", bg = "#141414" }), -- TelescopePromptBorder xxx guifg=#665d5c guibg=#141414
    NotifyTRACETitle({ fg = "#7c9ffa" }), -- NotifyTRACETitle xxx guifg=#7c9ffa
    NotifyINFOTitle({ fg = "#7c9ffa" }), -- NotifyINFOTitle xxx guifg=#7c9ffa
    IndentBlanklineSpaceCharBlankline({ fg = "#7c9ffa", gui = "nocombine" }), -- IndentBlanklineSpaceCharBlankline xxx cterm=nocombine gui=nocombine guifg=#7c9ffa
    IndentBlanklineSpaceChar({ fg = "#7c9ffa", gui = "nocombine" }), -- IndentBlanklineSpaceChar xxx cterm=nocombine gui=nocombine guifg=#7c9ffa
    CmpItemAbbrDeprecatedDefault({ fg = "#665d5c" }), -- CmpItemAbbrDeprecatedDefault xxx guifg=#665d5c
    CmpItemAbbrDeprecated({ CmpItemAbbrDeprecatedDefault }), -- CmpItemAbbrDeprecated xxx links to CmpItemAbbrDeprecatedDefault
    CmpItemKindDefault({ fg = "#696969" }), -- CmpItemKindDefault xxx guifg=#696969
    CmpItemKind({ CmpItemKindDefault }), -- CmpItemKind    xxx links to CmpItemKindDefault
    TreesitterContext({ fg = palette.base.fg, bg = "#2a2f37" }), -- TreesitterContext xxx guifg=#ffffff guibg=#2a2f37
    Sneak({ fg = "#002335", bg = "#ffd5d1" }), -- Sneak          xxx guifg=#002335 guibg=#ffd5d1
    diffAdded({ fg = "#32a0b4", bg = "#28383c" }), -- diffAdded      xxx guifg=#32a0b4 guibg=#28383c
    diffRemoved({ fg = "#b40000", bg = "#28383c" }), -- diffRemoved    xxx guifg=#b40000 guibg=#28383c
    diffLine({ fg = "#a2926c" }), -- diffLine       xxx guifg=#a2926c
    diffNoEOL({ fg = "#a2926c" }), -- diffNoEOL      xxx guifg=#a2926c
    -- lualine_a_inactive { fg = "#8f968e", gui = "bold", bg = "#2a3e5b" }, -- lualine_a_inactive xxx gui=bold guifg=#8f968e guibg=#2a3e5b
    -- lualine_c_inactive { fg = "#e0e0e0", bg = "#161616" }, -- lualine_c_inactive xxx guifg=#e0e0e0 guibg=#161616
    -- lualine_b_inactive { fg = "#435774", bg = "#080f07" }, -- lualine_b_inactive xxx guifg=#435774 guibg=#080f07
    -- lualine_a_insert { fg = "#080f07", gui = "bold", bg = "#b8a591" }, -- lualine_a_insert xxx gui=bold guifg=#080f07 guibg=#b8a591
    -- lualine_c_insert { fg = "#e0e0e0", bg = "#161616" }, -- lualine_c_insert xxx guifg=#e0e0e0 guibg=#161616
    -- lualine_b_insert { fg = "#b8a591", bg = "#080f07" }, -- lualine_b_insert xxx guifg=#b8a591 guibg=#080f07
    -- lualine_a_replace { fg = "#080f07", gui = "bold", bg = "#ffffff" }, -- lualine_a_replace xxx gui=bold guifg=#080f07 guibg=#ffffff
    -- lualine_c_replace { fg = "#e0e0e0", bg = "#161616" }, -- lualine_c_replace xxx guifg=#e0e0e0 guibg=#161616
    -- lualine_b_replace { fg = "#ffffff", bg = "#080f07" }, -- lualine_b_replace xxx guifg=#ffffff guibg=#080f07
    -- lualine_a_visual { fg = "#080f07", gui = "bold", bg = "#737373" }, -- lualine_a_visual xxx gui=bold guifg=#080f07 guibg=#737373
    -- lualine_c_visual { fg = "#e0e0e0", bg = "#161616" }, -- lualine_c_visual xxx guifg=#e0e0e0 guibg=#161616
    -- lualine_b_visual { fg = "#737373", bg = "#080f07" }, -- lualine_b_visual xxx guifg=#737373 guibg=#080f07
    -- lualine_a_terminal { fg = "#080f07", gui = "bold", bg = "#e0e0e0" }, -- lualine_a_terminal xxx gui=bold guifg=#080f07 guibg=#e0e0e0
    -- lualine_c_terminal { fg = "#e0e0e0", bg = "#161616" }, -- lualine_c_terminal xxx guifg=#e0e0e0 guibg=#161616
    -- lualine_b_terminal { fg = "#e0e0e0", bg = "#080f07" }, -- lualine_b_terminal xxx guifg=#e0e0e0 guibg=#080f07
    -- lualine_a_normal { fg = "#8f968e", gui = "bold", bg = "#2a3e5b" }, -- lualine_a_normal xxx gui=bold guifg=#8f968e guibg=#2a3e5b
    -- lualine_c_normal { fg = "#e0e0e0", bg = "#161616" }, -- lualine_c_normal xxx guifg=#e0e0e0 guibg=#161616
    -- lualine_b_normal { fg = "#435774", bg = "#080f07" }, -- lualine_b_normal xxx guifg=#435774 guibg=#080f07
    -- lualine_a_command { fg = "#080f07", gui = "bold", bg = "#e0e0e0" }, -- lualine_a_command xxx gui=bold guifg=#080f07 guibg=#e0e0e0
    -- lualine_c_command { fg = "#e0e0e0", bg = "#161616" }, -- lualine_c_command xxx guifg=#e0e0e0 guibg=#161616
    -- lualine_b_command { fg = "#e0e0e0", bg = "#080f07" }, -- lualine_b_command xxx guifg=#e0e0e0 guibg=#080f07
    -- lualine_c_diff_added_normal { fg = "#32a0b4", bg = "#161616" }, -- lualine_c_diff_added_normal xxx guifg=#32a0b4 guibg=#161616
    -- lualine_c_diff_added_insert { fg = "#32a0b4", bg = "#161616" }, -- lualine_c_diff_added_insert xxx guifg=#32a0b4 guibg=#161616
    -- lualine_c_diff_added_visual { fg = "#32a0b4", bg = "#161616" }, -- lualine_c_diff_added_visual xxx guifg=#32a0b4 guibg=#161616
    -- lualine_c_diff_added_replace { fg = "#32a0b4", bg = "#161616" }, -- lualine_c_diff_added_replace xxx guifg=#32a0b4 guibg=#161616
    -- lualine_c_diff_added_command { fg = "#32a0b4", bg = "#161616" }, -- lualine_c_diff_added_command xxx guifg=#32a0b4 guibg=#161616
    -- lualine_c_diff_added_terminal { fg = "#32a0b4", bg = "#161616" }, -- lualine_c_diff_added_terminal xxx guifg=#32a0b4 guibg=#161616
    -- lualine_c_diff_added_inactive { fg = "#32a0b4", bg = "#161616" }, -- lualine_c_diff_added_inactive xxx guifg=#32a0b4 guibg=#161616
    -- lualine_c_diff_modified_normal { fg = "#e6b450", bg = "#161616" }, -- lualine_c_diff_modified_normal xxx guifg=#e6b450 guibg=#161616
    -- lualine_c_diff_modified_insert { fg = "#e6b450", bg = "#161616" }, -- lualine_c_diff_modified_insert xxx guifg=#e6b450 guibg=#161616
    -- lualine_c_diff_modified_visual { fg = "#e6b450", bg = "#161616" }, -- lualine_c_diff_modified_visual xxx guifg=#e6b450 guibg=#161616
    -- lualine_c_diff_modified_replace { fg = "#e6b450", bg = "#161616" }, -- lualine_c_diff_modified_replace xxx guifg=#e6b450 guibg=#161616
    -- lualine_c_diff_modified_command { fg = "#e6b450", bg = "#161616" }, -- lualine_c_diff_modified_command xxx guifg=#e6b450 guibg=#161616
    -- lualine_c_diff_modified_terminal { fg = "#e6b450", bg = "#161616" }, -- lualine_c_diff_modified_terminal xxx guifg=#e6b450 guibg=#161616
    -- lualine_c_diff_modified_inactive { fg = "#e6b450", bg = "#161616" }, -- lualine_c_diff_modified_inactive xxx guifg=#e6b450 guibg=#161616
    -- lualine_c_diff_removed_normal { fg = "#b40000", bg = "#161616" }, -- lualine_c_diff_removed_normal xxx guifg=#b40000 guibg=#161616
    -- lualine_c_diff_removed_insert { fg = "#b40000", bg = "#161616" }, -- lualine_c_diff_removed_insert xxx guifg=#b40000 guibg=#161616
    -- lualine_c_diff_removed_visual { fg = "#b40000", bg = "#161616" }, -- lualine_c_diff_removed_visual xxx guifg=#b40000 guibg=#161616
    -- lualine_c_diff_removed_replace { fg = "#b40000", bg = "#161616" }, -- lualine_c_diff_removed_replace xxx guifg=#b40000 guibg=#161616
    -- lualine_c_diff_removed_command { fg = "#b40000", bg = "#161616" }, -- lualine_c_diff_removed_command xxx guifg=#b40000 guibg=#161616
    -- lualine_c_diff_removed_terminal { fg = "#b40000", bg = "#161616" }, -- lualine_c_diff_removed_terminal xxx guifg=#b40000 guibg=#161616
    -- lualine_c_diff_removed_inactive { fg = "#b40000", bg = "#161616" }, -- lualine_c_diff_removed_inactive xxx guifg=#b40000 guibg=#161616
    -- lualine_c_diagnostics_error_normal { fg = "#b1501b", bg = "#161616" }, -- lualine_c_diagnostics_error_normal xxx guifg=#b1501b guibg=#161616
    -- lualine_c_diagnostics_error_insert { fg = "#b1501b", bg = "#161616" }, -- lualine_c_diagnostics_error_insert xxx guifg=#b1501b guibg=#161616
    -- lualine_c_diagnostics_error_visual { fg = "#b1501b", bg = "#161616" }, -- lualine_c_diagnostics_error_visual xxx guifg=#b1501b guibg=#161616
    -- lualine_c_diagnostics_error_replace { fg = "#b1501b", bg = "#161616" }, -- lualine_c_diagnostics_error_replace xxx guifg=#b1501b guibg=#161616
    -- lualine_c_diagnostics_error_command { fg = "#b1501b", bg = "#161616" }, -- lualine_c_diagnostics_error_command xxx guifg=#b1501b guibg=#161616
    -- lualine_c_diagnostics_error_terminal { fg = "#b1501b", bg = "#161616" }, -- lualine_c_diagnostics_error_terminal xxx guifg=#b1501b guibg=#161616
    -- lualine_c_diagnostics_error_inactive { fg = "#b1501b", bg = "#161616" }, -- lualine_c_diagnostics_error_inactive xxx guifg=#b1501b guibg=#161616
    -- lualine_c_diagnostics_warn_normal { fg = "#d6b147", bg = "#161616" }, -- lualine_c_diagnostics_warn_normal xxx guifg=#d6b147 guibg=#161616
    -- lualine_c_diagnostics_warn_insert { fg = "#d6b147", bg = "#161616" }, -- lualine_c_diagnostics_warn_insert xxx guifg=#d6b147 guibg=#161616
    -- lualine_c_diagnostics_warn_visual { fg = "#d6b147", bg = "#161616" }, -- lualine_c_diagnostics_warn_visual xxx guifg=#d6b147 guibg=#161616
    -- lualine_c_diagnostics_warn_replace { fg = "#d6b147", bg = "#161616" }, -- lualine_c_diagnostics_warn_replace xxx guifg=#d6b147 guibg=#161616
    -- lualine_c_diagnostics_warn_command { fg = "#d6b147", bg = "#161616" }, -- lualine_c_diagnostics_warn_command xxx guifg=#d6b147 guibg=#161616
    -- lualine_c_diagnostics_warn_terminal { fg = "#d6b147", bg = "#161616" }, -- lualine_c_diagnostics_warn_terminal xxx guifg=#d6b147 guibg=#161616
    -- lualine_c_diagnostics_warn_inactive { fg = "#d6b147", bg = "#161616" }, -- lualine_c_diagnostics_warn_inactive xxx guifg=#d6b147 guibg=#161616
    -- lualine_c_diagnostics_info_normal { fg = "#a1d5a1", bg = "#161616" }, -- lualine_c_diagnostics_info_normal xxx guifg=#a1d5a1 guibg=#161616
    -- lualine_c_diagnostics_info_insert { fg = "#a1d5a1", bg = "#161616" }, -- lualine_c_diagnostics_info_insert xxx guifg=#a1d5a1 guibg=#161616
    -- lualine_c_diagnostics_info_visual { fg = "#a1d5a1", bg = "#161616" }, -- lualine_c_diagnostics_info_visual xxx guifg=#a1d5a1 guibg=#161616
    -- lualine_c_diagnostics_info_replace { fg = "#a1d5a1", bg = "#161616" }, -- lualine_c_diagnostics_info_replace xxx guifg=#a1d5a1 guibg=#161616
    -- lualine_c_diagnostics_info_command { fg = "#a1d5a1", bg = "#161616" }, -- lualine_c_diagnostics_info_command xxx guifg=#a1d5a1 guibg=#161616
    -- lualine_c_diagnostics_info_terminal { fg = "#a1d5a1", bg = "#161616" }, -- lualine_c_diagnostics_info_terminal xxx guifg=#a1d5a1 guibg=#161616
    -- lualine_c_diagnostics_info_inactive { fg = "#a1d5a1", bg = "#161616" }, -- lualine_c_diagnostics_info_inactive xxx guifg=#a1d5a1 guibg=#161616
    -- lualine_c_diagnostics_hint_normal { fg = "#a1a1d5", bg = "#161616" }, -- lualine_c_diagnostics_hint_normal xxx guifg=#a1a1d5 guibg=#161616
    -- lualine_c_diagnostics_hint_insert { fg = "#a1a1d5", bg = "#161616" }, -- lualine_c_diagnostics_hint_insert xxx guifg=#a1a1d5 guibg=#161616
    -- lualine_c_diagnostics_hint_visual { fg = "#a1a1d5", bg = "#161616" }, -- lualine_c_diagnostics_hint_visual xxx guifg=#a1a1d5 guibg=#161616
    -- lualine_c_diagnostics_hint_replace { fg = "#a1a1d5", bg = "#161616" }, -- lualine_c_diagnostics_hint_replace xxx guifg=#a1a1d5 guibg=#161616
    -- lualine_c_diagnostics_hint_command { fg = "#a1a1d5", bg = "#161616" }, -- lualine_c_diagnostics_hint_command xxx guifg=#a1a1d5 guibg=#161616
    -- lualine_c_diagnostics_hint_terminal { fg = "#a1a1d5", bg = "#161616" }, -- lualine_c_diagnostics_hint_terminal xxx guifg=#a1a1d5 guibg=#161616
    -- lualine_c_diagnostics_hint_inactive { fg = "#a1a1d5", bg = "#161616" }, -- lualine_c_diagnostics_hint_inactive xxx guifg=#a1a1d5 guibg=#161616
    GitSignsStagedAdd({ fg = "#506a50" }), -- GitSignsStagedAdd xxx guifg=#506a50
    GitSignsStagedChange({ fg = "#6b5823" }), -- GitSignsStagedChange xxx guifg=#6b5823
    GitSignsStagedDelete({ fg = "#58280d" }), -- GitSignsStagedDelete xxx guifg=#58280d
    GitSignsStagedChangedelete({ fg = "#6b5823" }), -- GitSignsStagedChangedelete xxx guifg=#6b5823
    GitSignsStagedTopdelete({ fg = "#58280d" }), -- GitSignsStagedTopdelete xxx guifg=#58280d
    GitSignsStagedAddNr({ fg = "#506a50" }), -- GitSignsStagedAddNr xxx guifg=#506a50
    GitSignsStagedChangeNr({ fg = "#6b5823" }), -- GitSignsStagedChangeNr xxx guifg=#6b5823
    GitSignsStagedDeleteNr({ fg = "#58280d" }), -- GitSignsStagedDeleteNr xxx guifg=#58280d
    GitSignsStagedChangedeleteNr({ fg = "#6b5823" }), -- GitSignsStagedChangedeleteNr xxx guifg=#6b5823
    GitSignsStagedTopdeleteNr({ fg = "#58280d" }), -- GitSignsStagedTopdeleteNr xxx guifg=#58280d
    GitSignsStagedAddLn({ fg = "#666666", bg = "#204437" }), -- GitSignsStagedAddLn xxx guifg=#666666 guibg=#204437
    GitSignsStagedChangeLn({ bg = "#1f2325" }), -- GitSignsStagedChangeLn xxx guibg=#1f2325
    GitSignsStagedChangedeleteLn({ bg = "#1f2325" }), -- GitSignsStagedChangedeleteLn xxx guibg=#1f2325
  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
