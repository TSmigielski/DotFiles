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

-- Workaround https://github.com/omacom/omarchy/issues/15793
hl.env("GDK_WAYLAND_DISABLE", "ext_background_effect_manager_v1")
