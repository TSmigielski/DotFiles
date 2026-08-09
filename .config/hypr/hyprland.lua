Left = "h"
Down = "j"
Up = "k"
Right = "l"

-- XWayland apps fix
hl.on("hyprland.start", function()
   hl.exec_cmd("xrdb ~/.config/hypr/xresources")
end)

require("bindings")
require("monitors")
require("settings")
require("windowRules")
