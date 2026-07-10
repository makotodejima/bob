local M = {}

---@class bob.Config
M.defaults = {
  ---Disable background colors for use in a transparent terminal.
  transparent = false,
  ---Set `vim.g.terminal_color_*` so `:terminal` matches the theme.
  terminal_colors = true,
  ---Override palette colors before highlights are built.
  ---@type fun(colors: bob.Palette)
  on_colors = function(_colors) end,
  ---Override highlight groups after they are built.
  ---@type fun(highlights: table<string, vim.api.keyset.highlight>, colors: bob.Palette)
  on_highlights = function(_highlights, _colors) end,
}

---@type bob.Config
M.options = vim.deepcopy(M.defaults)

---@param opts? bob.Config
---@return bob.Config
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})
  return M.options
end

return M
