local ColorUtils = require("lib/colors")
local Utils = {}

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

function hex2color(hex)
  local r,g,b = hex2rgb(hex)
  local h,s,l = ColorUtils.rgb_to_hsl(r,g,b)
  return ColorUtils.new(h,s,l)
end

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

function Utils.defineHTMLColor(colorName, hexColor)
  tex.sprint("\\definecolor{",colorName, "}{HTML}{",hexColor, "}")
end

return Utils