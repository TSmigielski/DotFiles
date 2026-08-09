hl.monitor({
   output = "DP-1",
   mode = "2560x1440@170",
   position = "1920x-360"
})

hl.monitor({
   output = "DP-2",
   mode = "1920x1080@75",
   position = "0x0"
})

local keys = {
   "Q",
   "W",
   "E",
   "R",
   "T",
   "1",
   "2",
   "3",
   "4",
   "5"
}

for i = 1, 10 do
   local key = keys[i]
   hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
   hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))

   hl.workspace_rule({
      workspace = tostring(i),
      monitor = i <= 5 and "DP-1" or "DP-2",
      default = i == 1 or i == 6
   })
end
