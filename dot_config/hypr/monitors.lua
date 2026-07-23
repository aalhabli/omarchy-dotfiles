-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 1.25
local omarchy_monitor_scale = 1.25

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- HDR (Auto HDR) on the LG TV (HDMI-A-1).
-- 10-bit output is what actually enables HDR/PQ. With Auto HDR the desktop
-- stays SDR and Hyprland switches to HDR only for fullscreen HDR content
-- (games, video) via render.cm_auto_hdr below. To instead force the *whole*
-- desktop into HDR, add cm = "hdr" here and tune sdrbrightness/sdrsaturation.
hl.monitor({ output = "HDMI-A-1", mode = "3840x2160@60", position = "0x0", scale = omarchy_monitor_scale, bitdepth = 10 })

hl.config({
  render = {
    cm_enabled = true, -- color management pipeline, required for HDR (default true)
    cm_auto_hdr = 1,   -- 0 = off, 1 = auto-switch fullscreen HDR content to "hdr", 2 = "hdredid"
  },
})

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
