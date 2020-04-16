local Utils = require("src/Utils")
local config = require("src/config")

local baseConfig = Utils.checkColors(config)

print(baseConfig)

return {
    PrimaryColor            = baseConfig.PrimaryColor;
    PrimaryColorLight       = baseConfig.PrimaryColorLight;
    PrimaryColorDark        = baseConfig.PrimaryColorDark;
    PrimaryTextColor        = baseConfig.PrimaryTextColor;
    SecondaryColor          = baseConfig.SecondaryColor;
    SecondaryColorLight     = baseConfig.SecondaryColorLight;
    SecondaryColorDark      = baseConfig.SecondaryColorDark;
    SecondaryTextColor      = baseConfig.SecondaryTextColor;
    AccentColor             = baseConfig.AccentColor;
    Shadow                  = baseConfig.Shadow;
    BackgroundColor1        = baseConfig.BackgroundColor1;
    BackgroundColor2        = baseConfig.BackgroundColor1;
    BackgroundColor3        = baseConfig.BackgroundColor3;
    BackgroundColor4        = baseConfig.BackgroundColor3;
}