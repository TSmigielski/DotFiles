hl.curve("spring", {
   type = "spring",
   mass = 1,
   stiffness = 210,
   dampening = 24
})

hl.animation({
   leaf = "global",
   enabled = true,
   speed = 1,
   spring = "spring"
})

hl.config({
   decoration = {
      rounding = 0,
      active_opacity = .92,
      inactive_opacity = .88,

      blur = {
         size = 6,
         passes = 3
      },

      shadow = {
         range = 2
      },

      motion_blur = {
         enabled = true
      }
   },

   dwindle = {
      preserve_split = true,
      force_split = 2
   },

   ecosystem = {
      no_donation_nag = true
   },

   general = {
      gaps_in = 5,
      gaps_out = 10,
      border_size = 0,
      resize_on_border = true,
      hover_icon_on_border = true,
      allow_tearing = true,
      layout = "dwindle",

      snap = {
         enabled = true,
         respect_gaps = true
      }
   },

   input = {
      kb_layout = "pl",
      numlock_by_default = true,

      follow_mouse = 1,
      mouse_refocus = false,

      touchpad = {
         natural_scroll = true,
         scroll_factor = .2
      },

      sensitivity = .1,
      accel_profile = "flat",
      repeat_delay = 280,
      repeat_rate = 30
   },

   misc = {
      force_default_wallpaper = 0,
      disable_hyprland_logo = true,
      -- float_force_onscreen = 1,
      vrr = 2 -- Freesync (full-screen only)
   }
})
