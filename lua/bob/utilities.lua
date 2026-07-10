local M = {}

-- Convert hex to RGB
local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

-- Convert RGB to hex
local function rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", math.floor(r + 0.5), math.floor(g + 0.5), math.floor(b + 0.5))
end

-- Convert RGB to HSL
local function rgb_to_hsl(r, g, b)
  r, g, b = r / 255, g / 255, b / 255
  local max, min = math.max(r, g, b), math.min(r, g, b)
  local h, s, l = 0, 0, (max + min) / 2

  if max == min then
    h, s = 0, 0 -- achromatic
  else
    local d = max - min
    s = l > 0.5 and d / (2 - max - min) or d / (max + min)
    if max == r then
      h = (g - b) / d + (g < b and 6 or 0)
    elseif max == g then
      h = (b - r) / d + 2
    elseif max == b then
      h = (r - g) / d + 4
    end
    h = h / 6
  end

  return h, s, l
end

-- Convert HSL to RGB
local function hsl_to_rgb(h, s, l)
  local function hue_to_rgb(p, q, t)
    if t < 0 then
      t = t + 1
    end
    if t > 1 then
      t = t - 1
    end
    if t < 1 / 6 then
      return p + (q - p) * 6 * t
    end
    if t < 1 / 2 then
      return q
    end
    if t < 2 / 3 then
      return p + (q - p) * (2 / 3 - t) * 6
    end
    return p
  end

  local r, g, b
  if s == 0 then
    r, g, b = l, l, l -- achromatic
  else
    local q = l < 0.5 and l * (1 + s) or l + s - l * s
    local p = 2 * l - q
    r = hue_to_rgb(p, q, h + 1 / 3)
    g = hue_to_rgb(p, q, h)
    b = hue_to_rgb(p, q, h - 1 / 3)
  end

  return math.floor(r * 255 + 0.5), math.floor(g * 255 + 0.5), math.floor(b * 255 + 0.5)
end

-- Darken a color by a percentage (0-100)
function M.darken(color, percentage)
  if type(color) ~= "string" or not color:match("^#%x%x%x%x%x%x$") then
    return color
  end

  local r, g, b = hex_to_rgb(color)
  local h, s, l = rgb_to_hsl(r, g, b)

  l = math.max(0, l - (percentage / 100))

  local new_r, new_g, new_b = hsl_to_rgb(h, s, l)
  return rgb_to_hex(new_r, new_g, new_b)
end

-- Lighten a color by a percentage (0-100)
function M.lighten(color, percentage)
  if type(color) ~= "string" or not color:match("^#%x%x%x%x%x%x$") then
    return color
  end

  local r, g, b = hex_to_rgb(color)
  local h, s, l = rgb_to_hsl(r, g, b)

  l = math.min(1, l + (percentage / 100))

  local new_r, new_g, new_b = hsl_to_rgb(h, s, l)
  return rgb_to_hex(new_r, new_g, new_b)
end

return M
