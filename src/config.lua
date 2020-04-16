local Utils = require("src/Utils")

local PrimaryColor = "2196f3"
local PrimaryColorLight -- = "87fbff"
local PrimaryColorDark -- = "002f8c"
local PrimaryTextColor -- = "edffff"
local SecondaryColor = "fafafa"
local SecondaryColorLight -- = "ffffff"
local SecondaryColorDark = "949494"
local SecondaryTextColor = "00000d"
local AccentColor = "80d8ff"
local Shadow = "000000"
local BackgroundColor1 = "e0e0e0"
local BackgroundColor2 = "f5f5f5"
local BackgroundColor3 = "fafafa"
local BackgroundColor4 = "ffffff"

local FACTOR_BRIGHTEN = 1.8
local FACTOR_DARKEN = 0.4

local BrightTextColor = Utils.changeColorBrightness(PrimaryColor, FACTOR_BRIGHTEN)
local DarkTextColor = Utils.changeColorBrightness(PrimaryColor, FACTOR_BRIGHTEN)

if PrimaryColorLight == nil then
    PrimaryColorLight = Utils.changeColorBrightness(PrimaryColor, FACTOR_DARKEN)
end
if PrimaryColorDark == nil then
    PrimaryColorDark = Utils.changeColorBrightness(PrimaryColor, FACTOR_DARKEN)
end
if PrimaryTextColor == nil then
    PrimaryTextColor = Utils.getContrastingColor(PrimaryColor, BrightTextColor, DarkTextColor)
end
if SecondaryColorLight == nil then
    SecondaryColorLight = Utils.changeColorBrightness(SecondaryColor, FACTOR_BRIGHTEN)
end
if SecondaryColorDark == nil then
    SecondaryColorDark = Utils.changeColorBrightness(SecondaryColor, FACTOR_DARKEN)
end
if SecondaryTextColor == nil then
    SecondaryTextColor = Utils.getContrastingColor(SecondaryColor, BrightTextColor, DarkTextColor)
end

return {
    PrimaryColor = PrimaryColor;
    PrimaryColorLight = PrimaryColorLight;
    PrimaryColorDark = PrimaryColorDark;
    PrimaryTextColor = PrimaryTextColor;
    SecondaryColor = SecondaryColor;
    SecondaryColorLight = SecondaryColorLight;
    SecondaryColorDark = SecondaryColorDark;
    SecondaryTextColor = SecondaryTextColor;
    AccentColor = AccentColor;
    Shadow = Shadow;
    BackgroundColor1 = BackgroundColor1;
    BackgroundColor2 = BackgroundColor1;
    BackgroundColor3 = BackgroundColor3;
    BackgroundColor4 = BackgroundColor3;
}