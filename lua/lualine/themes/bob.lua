local p = require("bob.palette")

local bob = {}

bob.normal = {
  a = { bg = p.smooth_blue, fg = p.base, gui = "bold" },
  b = { bg = p.highlight_high, fg = p.text },
  c = { bg = p.highlight_med, fg = p.off_white },
}

bob.insert = {
  a = { bg = p.emerald, fg = p.base, gui = "bold" },
  b = { bg = p.highlight_high, fg = p.text },
  c = { bg = p.highlight_med, fg = p.off_white },
}

bob.visual = {
  a = { bg = p.accent_purple, fg = p.base, gui = "bold" },
  b = { bg = p.highlight_high, fg = p.text },
  c = { bg = p.highlight_med, fg = p.off_white },
}

bob.replace = {
  a = { bg = p.mahogany, fg = p.base, gui = "bold" },
  b = { bg = p.highlight_high, fg = p.text },
  c = { bg = p.highlight_med, fg = p.off_white },
}

bob.command = {
  a = { bg = p.wheat, fg = p.base, gui = "bold" },
  b = { bg = p.highlight_high, fg = p.text },
  c = { bg = p.highlight_med, fg = p.off_white },
}

bob.terminal = {
  a = { bg = p.accent_blue, fg = p.base, gui = "bold" },
  b = { bg = p.highlight_high, fg = p.text },
  c = { bg = p.highlight_med, fg = p.off_white },
}

bob.inactive = {
  a = { bg = p.highlight_low, fg = p.muted },
  b = { bg = p.highlight_low, fg = p.muted },
  c = { bg = p.highlight_low, fg = p.muted },
}

return bob
