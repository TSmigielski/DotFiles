Left = "h"
Down = "j"
Up = "k"
Right = "l"

hl.on("hyprland.start", function()
   -- XWayland apps fix
   hl.exec_cmd("xrdb ~/.config/hypr/xresources")

   -- Hand PAM credentials to ksecretd so kwallet unlocks on login
   hl.exec_cmd("/usr/lib/pam_kwallet_init")
end)

require("bindings")
require("monitors")
require("settings")
require("windowRules")
