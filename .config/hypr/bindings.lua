hl.bind("SUPER + SUPER_L", hl.dsp.exec_cmd("ags request toggle-menu"), { release = true })

hl.bind("SUPER + " .. Left, hl.dsp.focus({direction = "left"}))
hl.bind("SUPER + " .. Right, hl.dsp.focus({direction = "right"}))
hl.bind("SUPER + " .. Up, hl.dsp.focus({direction = "up"}))
hl.bind("SUPER + " .. Down, hl.dsp.focus({direction = "down"}))

hl.bind("SUPER + SHIFT + " .. Left, hl.dsp.window.move({direction = "left"}))
hl.bind("SUPER + SHIFT + " .. Right, hl.dsp.window.move({direction = "right"}))
hl.bind("SUPER + SHIFT + " .. Up, hl.dsp.window.move({direction = "up"}))
hl.bind("SUPER + SHIFT + " .. Down, hl.dsp.window.move({direction = "down"}))

hl.bind("SUPER + F", hl.dsp.window.float())
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen())

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("uwsm app -- ghostty"))
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd("uwsm app -- brave"))
hl.bind("SUPER + CTRL + RETURN", hl.dsp.exec_cmd("uwsm app -- dolphin"))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("uwsm app -- hyprlock"))
hl.bind("SUPER + D", hl.dsp.exec_cmd('rofi -show drun -run-command "uwsm app -- {cmd}"'))

hl.bind("SUPER + SHIFT + C", hl.dsp.window.close())
hl.bind("SUPER + CTRL + SHIFT + C", hl.dsp.window.kill())
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("uwsm stop"))

hl.bind("PRINT", hl.dsp.exec_cmd("~/.config/hypr/utils/snip.sh"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

local changeVolume = "~/.config/hypr/utils/changeVolume.sh "
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(changeVolume .. "toggle"), {locked = true})
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(changeVolume .. "+2%"), {locked = true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(changeVolume .. "-2%"), {locked = true})

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause && dunstify playerctl Play/Pause"), {locked = true})
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause && dunstify playerctl Play/Pause"), {locked = true})
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next && dunstify playerctl Next"), {locked = true})
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous && dunstify playerctl Previous"), {locked = true})

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), {locked = true, repeating = true})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10-"), {locked = true, repeating = true})

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())
