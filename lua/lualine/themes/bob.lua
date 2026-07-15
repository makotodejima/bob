local p = require("bob.palette")

local bob = {}

bob.normal = {
  a = { bg = p.blue, fg = p.text, gui = "bold" },
  b = { bg = p.highlight_high, fg = p.text },
  c = { bg = p.highlight_med, fg = p.off_white },
}

bob.insert = {
  a = { bg = p.wheat, fg = p.base, gui = "bold" },
  b = { bg = p.highlight_high, fg = p.text },
  c = { bg = p.highlight_med, fg = p.off_white },
}

bob.visual = {
  a = { bg = p.ash, fg = p.base, gui = "bold" },
  b = { bg = p.highlight_high, fg = p.text },
  c = { bg = p.highlight_med, fg = p.off_white },
}

bob.replace = {
  a = { bg = p.text, fg = p.base, gui = "bold" },
  b = { bg = p.highlight_high, fg = p.text },
  c = { bg = p.highlight_med, fg = p.off_white },
}

bob.command = {
  a = { bg = p.text, fg = p.base, gui = "bold" },
  b = { bg = p.highlight_high, fg = p.text },
  c = { bg = p.highlight_med, fg = p.off_white },
}

bob.terminal = {
  a = { bg = p.text, fg = p.base, gui = "bold" },
  b = { bg = p.highlight_high, fg = p.text },
  c = { bg = p.highlight_med, fg = p.off_white },
}

bob.inactive = {
  a = { bg = p.highlight_low, fg = p.text },
  b = { bg = p.highlight_low, fg = p.text },
  c = { bg = p.highlight_low, fg = p.text },
}

return bob
