-- Rules
hl.window_rule({
   name = "ContextMenu",
   match = {
      tag = "contextMenu"
   },
   no_blur = true,
   rounding = 0,
   opacity = "1 override"
})

hl.window_rule({
   name = "NoOpacity",
   match = {
      tag = "noOpacity"
   },
   no_blur = true,
   opacity = "1 override"
})

-- Floating window tweaks
hl.window_rule({
   name = "FloatingWindows",
   match = {
      float = true
   },
   persistent_size = true,
   move = {
      "min(cursor_x+50, monitor_w-window_w-50)",
      "min(cursor_y+50, monitor_h-window_h-50)"
   },
   max_size = {
      "monitor_w-300",
      "monitor_h-300"
   }
})

-- Tag assignements
hl.window_rule({
   name = "ContextMenuUpgrade",
   tag = "+contextMenu",
   match = {
      float = true,
      class = "^$",
      title = "^$"
   }
})

hl.window_rule({
   name = "Unity",
   match = {
      class = "Unity"
   },
   tag = "+noOpacity",
   no_initial_focus = true
})

hl.window_rule({
   name = "Gimp",
   match = {
      class = "gimp"
   },
   tag = "+noOpacity"
})

hl.window_rule({
   name = "Krita",
   match = {
      class = "krita"
   },
   tag = "+noOpacity"
})

hl.window_rule({
   name = "Pinta",
   match = {
      class = "pinta|com.github.PintaProject.Pinta"
   },
   tag = "+noOpacity"
})

hl.window_rule({
   name = "Godot",
   match = {
      class = "org.godotengine.Editor"
   },
   tag = "+noOpacity"
})

hl.window_rule({
   name = "Satty",
   match = {
      class = "com.gabm.satty"
   },
   tag = "+noOpacity",
   float = true
})

-- Workspace assignements
hl.window_rule({
   name = "Brave",
   workspace = 6,
   match = {
      class = "brave-browser"
   }
})

hl.window_rule({
   name = "Feishin",
   workspace = 10,
   match = {
      class = "feishin"
   }
})

-- Other
hl.window_rule({
   name = "PcManFmFloat",
   match = {
      class = "pcmanfm-qt",
      initial_title = "Copy Files|Move Files|Search Files|Removable medium is inserted"
   },
   float = true
})

hl.window_rule({
   name = "EngrampaExtract",
   match = {
      class = "engrampa",
      initial_title = "Extract"
   },
   float = true
})

hl.window_rule({
   name = "Bitwarden",
   match = {
      initial_class = "brave-nngceckbapebfimnlniiiahkandclblb-Default"
   },
   float = true,
   size = { 480, 600 },
   move = "monitor_w-520 (monitor_h/2)-275"
})
