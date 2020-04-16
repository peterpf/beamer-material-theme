local ColorUtils = require("lib/colors")
local Utils = {}

-- Convert hex color representation to {r, g, b}, all values are in range 0-1.
-- Source: Somewhere on stackoverflow
function hex2rgb (hex)
  local hex = hex:gsub("#","")
  if hex:len() == 3 then
    return (tonumber("0x"..hex:sub(1,1))*17)/255, (tonumber("0x"..hex:sub(2,2))*17)/255, (tonumber("0x"..hex:sub(3,3))*17)/255
  else
    return tonumber("0x"..hex:sub(1,2))/255, tonumber("0x"..hex:sub(3,4))/255, tonumber("0x"..hex:sub(5,6))/255
  end
end

-- Convert {r, g, b} to a hex string. All values must be in range 0 - 255.
-- Source: https://gist.github.com/marceloCodget/3862929
function rgb2hex(rgb)
  local hexadecimal = ""
	for key, value in pairs(rgb) do
		local hex = ""

		while(value > 0)do
      local index = math.floor(value%16 + 1)
      value = math.floor(value / 16)
			hex = string.sub("0123456789ABCDEF", index, index) .. hex
		end

		if(string.len(hex) == 0)then
			hex = "00"

		elseif(string.len(hex) == 1)then
			hex = "0" .. hex
		end

		hexadecimal = hexadecimal .. hex
	end

	return hexadecimal
end

-- Convert a hex string to a Color object
function hex2color(hex)
  local r,g,b = hex2rgb(hex)
  local h,s,l = ColorUtils.rgb_to_hsl(r,g,b)
  return ColorUtils.new(h,s,l)
end

-- Represent a Color object in hex
function color2hex(color)
  local nr, ng, nb = ColorUtils.hsl_to_rgb(color.H, color.S, color.L)
  return rgb2hex({nr*255, ng*255, nb*255})
end

-- Multiply Luminance value of given color with factor
function Utils.changeColorBrightness(hexColor, factor)
  local color = hex2color(hexColor)
  color = color:lighten_by(factor)
  return color2hex(color)
end

-- Return the color (brighterHexColor, darkerHexColor) which is a better contrast fit for the given hexColor
function Utils.getContrastingColor(hexColor, brighterHexColor, darkerHexColor)
  local color = hex2color(hexColor)
  if color.L < 0.6 then
    return brighterHexColor
  else
    return darkerHexColor
  end
end

-- Return the corresponding LaTeX code to define a new HTML color
function Utils.defineHTMLColor(colorName, hexColor)
  tex.sprint("\\definecolor{",colorName, "}{HTML}{",hexColor, "}")
end

-- Perform checks on the colors and define missing optional colors.
function Utils.checkColors(config)
  -- Factors by which colors get brightened/darkened
  local FACTOR_BRIGHTEN = 1.8
  local FACTOR_DARKEN = 0.4

  -- Fallback colors if TextColors are not defined
  local BrightTextColor = Utils.changeColorBrightness(config.PrimaryColor, FACTOR_BRIGHTEN)
  local DarkTextColor = Utils.changeColorBrightness(config.PrimaryColor, FACTOR_BRIGHTEN)

  -- Define optional colors if they are missing
  if config.PrimaryColorLight == nil then
    config.PrimaryColorLight = Utils.changeColorBrightness(config.PrimaryColor, FACTOR_DARKEN)
  end
  if config.PrimaryColorDark == nil then
    config.PrimaryColorDark = Utils.changeColorBrightness(config.PrimaryColor, FACTOR_DARKEN)
  end
  if config.PrimaryTextColor == nil then
    config.PrimaryTextColor = Utils.getContrastingColor(config.PrimaryColor, BrightTextColor, DarkTextColor)
  end
  if config.SecondaryColorLight == nil then
    config.SecondaryColorLight = Utils.changeColorBrightness(config.SecondaryColor, FACTOR_BRIGHTEN)
  end
  if config.SecondaryColorDark == nil then
    config.SecondaryColorDark = Utils.changeColorBrightness(config.SecondaryColor, FACTOR_DARKEN)
  end
  if config.SecondaryTextColor == nil then
    config.SecondaryTextColor = Utils.getContrastingColor(config.SecondaryColor, BrightTextColor, DarkTextColor)
  end
  return config
end

return Utils