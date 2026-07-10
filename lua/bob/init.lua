local M = {}

---@param palette bob.Palette
local function set_terminal_colors(palette)
  vim.g.terminal_color_0 = palette.overlay
  vim.g.terminal_color_1 = palette.red
  vim.g.terminal_color_2 = palette.emerald
  vim.g.terminal_color_3 = palette.wheat
  vim.g.terminal_color_4 = palette.blue
  vim.g.terminal_color_5 = palette.accent_purple
  vim.g.terminal_color_6 = palette.accent_blue
  vim.g.terminal_color_7 = palette.text
  vim.g.terminal_color_8 = palette.muted
  vim.g.terminal_color_9 = palette.red
  vim.g.terminal_color_10 = palette.emerald
  vim.g.terminal_color_11 = palette.wheat
  vim.g.terminal_color_12 = palette.blue
  vim.g.terminal_color_13 = palette.accent_purple
  vim.g.terminal_color_14 = palette.accent_blue
  vim.g.terminal_color_15 = palette.text
end

---@param opts? bob.Config
function M.load(opts)
  if opts then
    require("bob.config").setup(opts)
  end

  local config = require("bob.config").options
  local palette = vim.deepcopy(require("bob.palette"))

  config.on_colors(palette)

  local highlights = require("bob.highlights").get(palette, config)
  config.on_highlights(highlights, palette)

  -- Apply all highlight groups
  for group_name, group_settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group_name, group_settings)
  end

  if config.terminal_colors then
    set_terminal_colors(palette)
  end
end

---@param opts? bob.Config
function M.setup(opts)
  require("bob.config").setup(opts)

  if vim.g.colors_name == "bob" then
    M.load()
  end
end

return M
